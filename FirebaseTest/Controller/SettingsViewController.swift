//
//  SettingsViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 22/10/2021.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
  let backButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Go-back"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goBackToProfileScreen), for: .touchUpInside)
    return button
  }()
  // MARK: - name of the session
  lazy var settingsNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Settings"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 20)
    label.numberOfLines = 1
    return label
  }()
    
    let logoutButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle("Logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
      button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.titleLabel!.font = .boldSystemFont(ofSize: 25)
      button.addTarget(self, action: #selector(logout), for: .touchUpInside)
      return button
    }()
    let logoutImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.image = UIImage(named: "Icon")
      return imageView
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    doBasicSetUp()
    setUpConstraint()
  }
    
    @objc func logout() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        } catch {
            print("Failed to logout")
        }
    }
  //  back button function
  @objc func goBackToProfileScreen() {
    let vc = HomeViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true)
  }
    func doBasicSetUp() {
      view.addSubview(backButton)
      view.addSubview(settingsNameLabel)
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
      NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        backButton.heightAnchor.constraint(equalToConstant: 28),
        backButton.widthAnchor.constraint(equalToConstant: 28),
        settingsNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        settingsNameLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: 140),
        logoutStack.topAnchor.constraint(equalTo: settingsNameLabel.bottomAnchor, constant: 30),
        logoutStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
      ])
    }
}

