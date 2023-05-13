//
//  BackdropView.swift
//  atm_iOS
//
//  Created by Constantin Senila on 13.05.2023.
//

import SwiftUI

open class UIBackdropView: UIView {
    open override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

public struct BackdropView: UIViewRepresentable {
    public init() {}
    
    public func makeUIView(context: Context) -> UIBackdropView {
        UIBackdropView()
    }
    
    public func updateUIView(_ uiView: UIBackdropView, context: Context) {}
}
