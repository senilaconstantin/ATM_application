# ATM Simulation Application

## Overview
This project is a simple **ATM Simulation Application** developed to demonstrate core programming concepts using **Object-Oriented Programming (OOP)** principles. 
It features a mobile application with a user-friendly interface and backend API integration. The application is built with the following technologies:

- **iOS Frontend**: Developed using **Swift** and **SwiftUI**.
- **Backend**: Built with **Java**, **Spring Boot**, and **PostgreSQL**.
- **Persistent Local Storage**: Used `UserDefaults` for local data storage in the iOS app.

The ATM application simulates basic ATM operations, including user authentication, balance inquiry, and cash withdrawal while handling rules and constraints such as card 
balance limits and ATM cash availability.

[Watch the app's introduction video on YouTube](https://youtu.be/ruL7wwfdesk)

---

## Features

### 1. ATM Initialization
- The ATM starts each day with 10 bills for each denomination:
  - 500 RON, 200 RON, 100 RON, 50 RON, 20 RON, 10 RON, and 5 RON.

### 2. User Authentication
- Users must input their **credit card number** and **PIN** to access the ATM.
- The default PIN for all cards is `1234`.
- Two types of cards are supported:
  - **Basic Card**: Initial balance of **500 RON**.
  - **Gold Card**: Initial balance of **1000 RON**.

### 3. ATM Operations
- **View Balance**: Users can check the current balance of their card.
- **Withdraw Money**:
  - Only amounts that are **multiples of 10 RON** can be withdrawn.
  - Validations:
    - If the requested amount exceeds the card's balance, a message is displayed: `"Insufficient Funds"`.
    - If the ATM does not have enough bills to fulfill the request, a message is displayed: `"The machine does not have enough funds, please enter a smaller amount"`.
  - If all validations pass:
    - The withdrawal amount is deducted from the card's balance.
    - The ATM's available cash stock is updated.
- After each operation, the user is prompted to either:
  - Perform another transaction.
  - Eject the card (logout).

### 4. Error Handling
- Displays appropriate messages based on user actions:
  - `"Insufficient Funds"`: If the requested withdrawal exceeds the card balance.
  - `"The machine does not have enough funds, please enter a smaller amount"`: If the ATM cannot fulfill the requested withdrawal.

---

## Technologies Used

### iOS Frontend
- **Swift & SwiftUI**: For a responsive, modern user interface.
- **UserDefaults**: Used for persistent local storage of user session data.

### Backend
- **Java & Spring Boot**: For the backend logic and REST API.
- **PostgreSQL**: To manage data storage for users and ATM cash details.
- **JSON Communication**: Ensures seamless data transfer between the frontend and backend.

---

## Project Structure

### Frontend (iOS)
- **Authentication**:
  - A singleton class (`CurrentCard`) manages the user's current session using `UserDefaults` to persist data like the current card and balance.
  - Core methods include:
    - `isLoggedIn`: Checks if a user session exists.
    - `getCard`: Retrieves the card details from local storage.
    - `saveCard`: Saves updated card details after transactions.
    - `updateSold`: Updates the card balance after a withdrawal.
    - `logout`: Logs out the user by clearing session data.
- **SwiftUI Views**: Provide a user interface for actions like entering the PIN, viewing the balance, and withdrawing money.

### Backend
- **ATM Logic**:
  - Validates:
    - If the card PIN is correct.
    - If the withdrawal amount does not exceed the card's balance or the ATM's cash availability.
  - Maintains the ATM's cash stock after every transaction.
- **REST API**:
  - Endpoints for:
    - Card authentication.
    - Retrieving and updating card balances.
    - Handling withdrawals.
- **PostgreSQL Database**:
  - Stores:
    - User data (e.g., card number, balance, and card type).
    - ATM cash stock data.

---

## How It Works

### ATM Simulation Workflow
1. **Authentication**:
   - User enters their card number and PIN via the iOS app.
   - The app sends the data to the backend for validation.
   - If valid, the session starts.

2. **Balance Inquiry**:
   - The app fetches the user's current balance via the backend API.

3. **Withdrawal**:
   - The user enters the withdrawal amount.
   - Backend checks:
     - The amount does not exceed the card's balance.
     - The ATM has enough bills to fulfill the request.
   - If valid:
     - The card balance is updated.
     - The ATM cash stock is updated.
     - A success message is displayed.
   - Otherwise, an error message is displayed.

4. **Session Termination**:
   - Users can log out after completing their transactions.
