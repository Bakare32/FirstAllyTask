//
//  SendMoney + extensions.swift
//  FirebaseTest
//
//  Created by  Decagon on 23/10/2021.
//

import UIKit

extension SendMoneyViewController {
    
    func setUpConstraint() {
        view.addSubview(pickViewer)
        view.addSubview(firstLabel)
        view.addSubview(emailTextField)
        view.addSubview(sendMoneyButton)
        view.addSubview(messageLabel)
        view.addSubview(topBackArrowButton)
        view.addSubview(pageTitleLabel)
        
        NSLayoutConstraint.activate([
            topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 250),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 290),
            emailTextField.heightAnchor.constraint(equalToConstant: 38),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickViewer.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            pickViewer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickViewer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendMoneyButton.topAnchor.constraint(equalTo: pickViewer.bottomAnchor, constant: 20),
            sendMoneyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            sendMoneyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            sendMoneyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sendMoneyButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
}
