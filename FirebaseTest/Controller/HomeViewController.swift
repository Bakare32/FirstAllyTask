//
//  ViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 15/10/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data: [SessionCard] = {
      let firstCard = SessionCard(title: "Savings")
      let secondCard = SessionCard(title: "Send Money")
      let thirdCard = SessionCard(title: "Receive Money")
      let fourthCard = SessionCard(title: "Settings")
      return [firstCard, secondCard, thirdCard, fourthCard]
    }()
    
    var tableView = UITableView()
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 70
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    let sleepBetterView: UIView = {
      let view = UIView()
      view.layer.cornerRadius = 15
        view.backgroundColor = .red
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    // MARK: - label to display name of session
    lazy var nameLabel: UILabel = {
      let label = UILabel()
      label.text = "Sleep better"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
      return label
    }()
    // MARK: - label to display time
    lazy var timeLabel: UILabel = {
      let label = UILabel()
      label.text = "35 min"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
      return label
    }()
    // MARK: - setting play icon image on a button
    lazy var playButtonIcon: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    // MARK: - session(sleep better) image view display
    lazy var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
    // MARK: - label to display sessions
    lazy var sessionLabel: UILabel = {
      let label = UILabel()
      label.text = "Sessions"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
      return label
    }()
    // MARK: - view to display information about a session
    let sessionSubView: UIView = {
      let view = UIView()
        view.backgroundColor = .blue
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        constraintViews()
//        configureTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
        constraintViews()
        configureTableView()
        view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    }

    func addDefaultViews() {
        view.addSubview(tableView)
      view.addSubview(sleepBetterView)
      view.addSubview(nameLabel)
      view.addSubview(timeLabel)
      view.addSubview(playButtonIcon)
      view.addSubview(imageView)
      view.addSubview(sessionLabel)
    }
    // MARK: - function to constrian all sub view
    func constraintViews() {
      addDefaultViews()
      self.navigationItem.setHidesBackButton(true, animated: true)
        tableView.anchorWithConstantsToTop(top: sessionLabel.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 10)
      NSLayoutConstraint.activate([
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as? TransactionTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = model.title
        cell.layer.borderWidth = 10
        cell.layer.cornerRadius = 20
                cell.layer.borderColor = UIColor.white.cgColor
                cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor(red: 0.2235, green: 0.1176, blue: 0.3608, alpha: 1.0)
                cell.textLabel?.font = UIFont(name: "Helvetica", size: 25.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cellItem = data[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
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

