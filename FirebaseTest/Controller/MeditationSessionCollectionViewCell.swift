//
//  MeditationSessionCollectionViewCell.swift
//  FirebaseTest
//
//  Created by  Decagon on 21/10/2021.
//

import UIKit

class MeditationSessionCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "cellId"
    var sessionCard: SessionCard? {
      didSet {
        guard let card = sessionCard else {
          return
        }
        timeLabel.text = card.time
        titleLabel.text = card.title
//        icon.setImage(card.icon, for: .normal)
      }
    }
    // MARK: - icon image on each cell
    lazy var icon: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    // MARK: - title of session on each cell
    lazy var titleLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
//      label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 17)
      label.numberOfLines = 1
      return label
    }()
    // MARK: - time descrription of session on each cell
    lazy var timeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
//      label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
      label.numberOfLines = 1
      return label
    }()
    // MARK: - setting go forward arrow on a button
    lazy var goForwardButton: UIButton = {
      let button = UIButton()
//      button.setImage(AppButtonImages.goForwardArrow.image, for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    override init(frame: CGRect) {
      super.init(frame: frame)
      setUpView()
    }

    // MARK: - FUNCTION TO SET UP VIEWS
    func setUpView() {
      backgroundColor = .white
      addSubview(timeLabel)
      addSubview(titleLabel)
      addSubview(goForwardButton)
      addSubview(icon)
      NSLayoutConstraint.activate([
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 7),
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
        icon.heightAnchor.constraint(equalToConstant: 50),
        icon.widthAnchor.constraint(equalToConstant: 50),
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
        titleLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 70),
        timeLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 25),
        timeLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 70),
        goForwardButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        goForwardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
      ])
    }
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
