//
//  SettingsViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 22/10/2021.
//

import UIKit

class SettingsViewController: UIViewController {
  let backButton: UIButton = {
    let button = UIButton()
//    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(goBackToProfileScreen), for: .touchUpInside)
    return button
  }()
  // MARK: - name of the session
  lazy var settingsNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Settings"
    label.translatesAutoresizingMaskIntoConstraints = false
//    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  //  Personal details view
  let personalDetailsView: UIView = {
    let view = UIView()
    let personalDetailsImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
//      imageView.image = AppButtonImages.profile.image
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let personalDetailsLabel: UILabel = {
      let label = UILabel.makeSettingslabel()
      label.text = "Personal Details"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let personalDetailsButton: UIButton = {
      let button = UIButton.makeSettingsButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(goToPersonalDetailScreen), for: .touchUpInside)
      return button
    }()
    view.addSubview(personalDetailsImage)
    view.addSubview(personalDetailsLabel)
    view.addSubview(personalDetailsButton)
    view.heightAnchor.constraint(equalToConstant: 48).isActive = true
    personalDetailsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    personalDetailsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    personalDetailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    personalDetailsLabel.leftAnchor.constraint(equalTo: personalDetailsImage.rightAnchor, constant: 20).isActive = true
    personalDetailsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    personalDetailsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  //  preference settings
  let preferenceView: UIView = {
    let view = UIView()
    let preferenceImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
//      imageView.image = AppButtonImages.preferences.image
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let preferenceLabel: UILabel = {
      let label = UILabel.makeSettingslabel()
      label.text = "Preferences"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let preferenceButton: UIButton = {
      let button = UIButton.makeSettingsButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(goToPreferenceScreen), for: .touchUpInside)
      return button
    }()
    view.addSubview(preferenceImage)
    view.addSubview(preferenceLabel)
    view.addSubview(preferenceButton)
    view.heightAnchor.constraint(equalToConstant: 48).isActive = true
    preferenceImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    preferenceImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    preferenceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    preferenceLabel.leftAnchor.constraint(equalTo: preferenceImage.rightAnchor, constant: 20).isActive = true
    preferenceButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    preferenceButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  //  Notification view
  let notificationsView: UIView = {
    let view = UIView()
    let notificationsImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
//      imageView.image = AppButtonImages.notification.image
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let notificationsLabel: UILabel = {
      let label = UILabel.makeSettingslabel()
      label.text = "Notifications"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let notificationsButton: UIButton = {
      let button = UIButton.makeSettingsButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(goToNotificationScreen), for: .touchUpInside)
      return button
    }()
    view.addSubview(notificationsImage)
    view.addSubview(notificationsLabel)
    view.addSubview(notificationsButton)
    view.heightAnchor.constraint(equalToConstant: 48).isActive = true
    notificationsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    notificationsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    notificationsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    notificationsLabel.leftAnchor.constraint(equalTo: notificationsImage.rightAnchor, constant: 20).isActive = true
    notificationsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    notificationsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  //  privacy policy view
  let privacyPolicyView: UIView = {
    let view = UIView()
    let privacyPolicyImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
//      imageView.image = AppButtonImages.privacyPolicy.image
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let privacyPolicyLabel: UILabel = {
      let label = UILabel.makeSettingslabel()
      label.text = "Privacy Policy"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let privacyPolicyButton: UIButton = {
      let button = UIButton.makeSettingsButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(goToPrivacyPolicyScreen), for: .touchUpInside)
      return button
    }()
    view.addSubview(privacyPolicyImage)
    view.addSubview(privacyPolicyLabel)
    view.addSubview(privacyPolicyButton)
    view.heightAnchor.constraint(equalToConstant: 48).isActive = true
    privacyPolicyImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    privacyPolicyImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    privacyPolicyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    privacyPolicyLabel.leftAnchor.constraint(equalTo: privacyPolicyImage.rightAnchor, constant: 20).isActive = true
    privacyPolicyButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    privacyPolicyButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  //  contact us view
  let contactUsView: UIView = {
    let view = UIView()
    let contactUsImage: UIImageView = {
      let imageView = UIImageView.makeSettingsImage()
//      imageView.image = AppButtonImages.contactUs.image
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    let contactUsLabel: UILabel = {
      let label = UILabel.makeSettingslabel()
      label.text = "Contact Us"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let contactUsButton: UIButton = {
      let button = UIButton.makeSettingsButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action: #selector(goToContactScreen), for: .touchUpInside)
      return button
    }()
    view.addSubview(contactUsImage)
    view.addSubview(contactUsLabel)
    view.addSubview(contactUsButton)
    view.heightAnchor.constraint(equalToConstant: 48).isActive = true
    contactUsImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    contactUsImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    contactUsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    contactUsLabel.leftAnchor.constraint(equalTo: contactUsImage.rightAnchor, constant: 20).isActive = true
    contactUsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    contactUsButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  //  logout view
  let logoutButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Logout", for: .normal)
//    button.setTitleColor(AppColors.black.color, for: .normal)
    button.heightAnchor.constraint(equalToConstant: 48).isActive = true
//    button.titleLabel!.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 17)
    button.addTarget(self, action: #selector(logout), for: .touchUpInside)
    return button
  }()
  let logoutImage: UIImageView = {
    let imageView = UIImageView.makeSettingsImage()
    imageView.translatesAutoresizingMaskIntoConstraints = false
//    imageView.image = AppButtonImages.logout.image
    return imageView
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    doBasicSetUp()
    setUpConstraint()
  }
  //  back button function
  @objc func goBackToProfileScreen() {
    navigationController?.popViewController(animated: true)
  }
  //  go to personal details screen function
  @objc func goToPersonalDetailScreen() {
//      let personalDetails = PersonalDetailsMainViewController()
//      navigationController?.pushViewController(personalDetails, animated: true)
//        navigationController?.navigationBar.isHidden = true
  }
  // go to preference screen
  @objc func goToPreferenceScreen() {
//    let nextController = PreferenceViewController()
//    navigationController?.pushViewController(nextController, animated: true)
//    navigationController?.navigationBar.isHidden = true
  }
  //  go to notification screen
  @objc func goToNotificationScreen() {
//    let nextController = NotificationsViewController()
//    navigationController?.pushViewController(nextController, animated: true)
//    navigationController?.navigationBar.isHidden = true
  }
  //  go to privacy policy screen
  @objc func goToPrivacyPolicyScreen() {
//    let nextController = PrivacyPolicyViewController()
//    navigationController?.pushViewController(nextController, animated: true)
//    navigationController?.navigationBar.isHidden = true
  }
  //  go to contact us screen
  @objc func goToContactScreen() {
//    let contactController = ContactUsViewController()
//    navigationController?.pushViewController(contactController, animated: true)
  }
  //  go to logout
  @objc func logout() {
  }
}
