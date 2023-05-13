//
//  APIClient.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI
import Foundation
import Alamofire

class APIClient {
    static var shared = APIClient()
    
    func saveCard(card: Card) {
        CurrentCard.shared.saveCard(card: card)
    }
    
    func login(model: LogInModel, responseLogIn: @escaping (_ data: Data?) -> Void) {
        let urlString = "http://localhost:8082/atm/login"
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(urlString,
                   method: .post,
                   parameters: model,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
        .response { response in
            debugPrint(response)
            DispatchQueue.main.async {
                switch response.result {
                case .success(let data):
                    responseLogIn(data)
                case .failure(let err):
                    print(err.localizedDescription)
                    responseLogIn(nil)
                }
            }
        }
    }
    
    func loginUser(number: String,
                   pin: String,
                   completionHandler: @escaping (_ tokenModel: Card?, _ error: String?) -> Void) {
        let model: LogInModel = .init(number: number, pin: pin)
        APIClient.shared.login(model: model) { data in
            if let data = data {
                guard let result = try? JSONDecoder().decode(Card.self, from: data) else {
                    completionHandler(nil, "Decoding error!")
                    return
                }
                DispatchQueue.main.async {
                    print(result)
                    let card = Card(number: result.number, sold: result.sold)
                    APIClient.shared.saveCard(card: card)
                    completionHandler(card, nil)
                }
            } else {
                completionHandler(nil, "Wrong credentials!")
            }
        }
    }
    
    func withdraw(card: Card, amount: Int, responseWithdraw: @escaping (_ data: Data?) -> Void) {
        let body: [String: Any] = ["number": card.number,
                                   "sold": card.sold]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        let urlString = "http://localhost:8082/atm/withdraw?amount=\(amount)"
        guard let url = URL(string: urlString) else {
            print("url found nil")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil, error == nil, let response = response as? HTTPURLResponse,
                  response.statusCode >= 200, response.statusCode < 300
            else {
                responseWithdraw(data)
                print("Response Error!")
                return
            }
            responseWithdraw(data)
        }
        .resume()
    }
    
    func withdrawUser(card: Card,
                      amount: Int,
                      responseWithdraw: @escaping (_ error: String) -> Void) {
        withdraw(card: card,
                 amount: amount) { data in
            if let data = data {
                guard let result = try? JSONDecoder().decode(MessageR.self, from: data) else {
                    responseWithdraw("Decoding error!")
                    return
                }
                DispatchQueue.main.async {
                    print(result)
                    if result.message == "Transaction successful" {
                        responseWithdraw("")
                        CurrentCard.shared.updateSold(amount: amount)
                    }
                    responseWithdraw(result.message)
                }
            }
        }
    }
}
