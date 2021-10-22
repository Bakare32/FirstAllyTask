//
//  Settings + extensions.swift
//  FirebaseTest
//
//  Created by  Decagon on 22/10/2021.
//

import UIKit
extension SettingsViewController {
  // function to set up the views
  func doBasicSetUp() {
    view.addSubview(backButton)
    view.addSubview(settingsNameLabel)
    view.addSubview(personalDetailsView)
    view.addSubview(preferenceView)
    view.addSubview(notificationsView)
    view.addSubview(privacyPolicyView)
    view.addSubview(contactUsView)
    view.addSubview(logoutImage)
    view.addSubview(logoutButton)
  }
  // Function to set up constraint
  func setUpConstraint() {
    let logoutStack = UIStackView(arrangedSubviews: [logoutImage, logoutButton])
    logoutStack.distribution = .equalSpacing
    logoutStack.spacing = 20
    logoutStack.axis = .horizontal
    logoutStack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(logoutStack)
    self.navigationItem.setHidesBackButton(true, animated: true)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
      backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.heightAnchor.constraint(equalToConstant: 28),
      backButton.widthAnchor.constraint(equalToConstant: 28),
      settingsNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
      settingsNameLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: 140),
      personalDetailsView.topAnchor.constraint(equalTo: settingsNameLabel.bottomAnchor, constant: 30),
      personalDetailsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      personalDetailsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //      preference constraints
      preferenceView.topAnchor.constraint(equalTo: personalDetailsView.bottomAnchor, constant: 30),
      preferenceView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      preferenceView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //      notification settings constraint
      notificationsView.topAnchor.constraint(equalTo: preferenceView.bottomAnchor, constant: 30),
      notificationsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      notificationsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //      privacy policy constraints
      privacyPolicyView.topAnchor.constraint(equalTo: notificationsView.bottomAnchor, constant: 30),
      privacyPolicyView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      privacyPolicyView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //      contact us constraints
      contactUsView.topAnchor.constraint(equalTo: privacyPolicyView.bottomAnchor, constant: 30),
      contactUsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      contactUsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      //      logoutStack view constraints
      logoutStack.topAnchor.constraint(equalTo: contactUsView.bottomAnchor, constant: 30),
      logoutStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
    ])
  }
}
// UIview extension
extension UIView {
  class func makeSettingslabel() -> UILabel {
    let label = UILabel()
    label.heightAnchor.constraint(equalToConstant: 48).isActive = true
    label.layer.borderWidth = 0
//    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 17)
    return label
  }
  class func makeSettingsButton() -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 28).isActive = true
    button.widthAnchor.constraint(equalToConstant: 28).isActive = true
    button.setImage(UIImage(named: "Go-Forward"), for: .normal)
    return button
  }
  class func makeSettingsImage() -> UIImageView {
    let imageView = UIImageView()
    imageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
    return imageView
  }
}

