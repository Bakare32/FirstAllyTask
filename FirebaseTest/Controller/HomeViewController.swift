//
//  ViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 15/10/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let sessionCards: [SessionCard] = {
      let firstCard = SessionCard(title: "Sleep Better", time: "2 min / 5 min")
      let secondCard = SessionCard(title: "Bad Dreams", time: "0 min / 10 min")
      let thirdCard = SessionCard(title: "Panic Attacks", time: "0 min / 5 min ")
      let fourthCard = SessionCard(title: "Phone Addiction", time: "0 min / 15min")
      let fifthCard = SessionCard(title: "Overthinking", time: "0 min / 5 min")
      return [firstCard, secondCard, thirdCard, fourthCard, fifthCard]
    }()
    let sleepBetterView: UIView = {
      let view = UIView()
//      view.backgroundColor = AppColors.white.color
      view.layer.cornerRadius = 15
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    // MARK: - label to display name of session
    lazy var nameLabel: UILabel = {
      let label = UILabel()
      label.text = "Sleep better"
      label.translatesAutoresizingMaskIntoConstraints = false
//      label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
      label.numberOfLines = 1
      return label
    }()
    // MARK: - label to display time
    lazy var timeLabel: UILabel = {
      let label = UILabel()
      label.text = "35 min"
      label.translatesAutoresizingMaskIntoConstraints = false
//      label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
      label.numberOfLines = 1
      return label
    }()
    // MARK: - setting play icon image on a button
    lazy var playButtonIcon: UIButton = {
      let button = UIButton()
//      button.setImage(AppButtonImages.longestSessionIcon.image, for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    // MARK: - session(sleep better) image view display
    lazy var imageView: UIImageView = {
      let imageView = UIImageView()
//      imageView.image = UIImage(named: AppImages.sleepBetter.image)
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    // MARK: - label to display sessions
    lazy var sessionLabel: UILabel = {
      let label = UILabel()
      label.text = "Sessions"
      label.translatesAutoresizingMaskIntoConstraints = false
//      label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
      label.numberOfLines = 1
      return label
    }()
    // MARK: - view to display information about a session
    let sessionSubView: UIView = {
      let view = UIView()
//      view.backgroundColor = AppColors.white.color
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    // MARK: - COLLECTION VIEW
    lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.minimumLineSpacing = 30
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.dataSource = self
      collectionView.delegate = self
      collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      collectionView.showsVerticalScrollIndicator = false
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        collectionView.register(MeditationSessionCollectionViewCell.self, forCellWithReuseIdentifier: MeditationSessionCollectionViewCell.identifier)
        constraintViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }

    func addDefaultViews() {
//      view.addSubview(backButton)
      view.addSubview(sleepBetterView)
      view.addSubview(nameLabel)
      view.addSubview(timeLabel)
      view.addSubview(playButtonIcon)
      view.addSubview(imageView)
      view.addSubview(sessionLabel)
      view.addSubview(collectionView)
      view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    }
    // MARK: - function to constrian all sub view
    func constraintViews() {
      addDefaultViews()
      self.navigationItem.setHidesBackButton(true, animated: true)
      NSLayoutConstraint.activate([
//        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
//        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
//        backButton.heightAnchor.constraint(equalToConstant: 28),
//        backButton.widthAnchor.constraint(equalToConstant: 28),
        sleepBetterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 132),
        sleepBetterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        sleepBetterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        sleepBetterView.heightAnchor.constraint(equalToConstant: 230),
        nameLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 36),
        nameLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
        timeLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 71),
        timeLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
        playButtonIcon.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 51),
        playButtonIcon.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
        playButtonIcon.bottomAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 37),
        imageView.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 90),
        imageView.trailingAnchor.constraint(equalTo: sleepBetterView.trailingAnchor, constant: 0),
        imageView.bottomAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 0),
        sessionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ),
        sessionLabel.topAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 60),
        sessionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 270)
      ])
      collectionView.anchorWithConstantsToTop(top: sessionLabel.topAnchor,
                                              left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 30, bottomConstant: 30, rightConstant: 30)
    }
    // MARK: - COLLECTION VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return sessionCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  guard let sessionCell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationSessionCollectionViewCell.identifier, for: indexPath)
            as? MeditationSessionCollectionViewCell else { return UICollectionViewCell() }
      sessionCell.sessionCard = sessionCards[indexPath.row]
      sessionCell.goForwardButton.addTarget(self, action: #selector(didTapGoForwardButton), for: .touchUpInside)
      sessionCell.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
      return sessionCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//      let nextController = SessionsViewController()
//      navigationController?.pushViewController(nextController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: 65)
    }
    // MARK: - function to move to the next view controller
    @objc func didTapGoForwardButton () {
//      let nextController = SessionsViewController()
//      navigationController?.pushViewController(nextController, animated: true)
    }
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

}

