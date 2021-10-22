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
        view.backgroundColor = UIColor(red: 0.1804, green: 0.1176, blue: 0.8392, alpha: 1.0)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    // MARK: - label to display name of session
    lazy var nameLabel: UILabel = {
      let label = UILabel()
      label.text = "Available Balance"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20.0)
      return label
    }()
    // MARK: - label to display time
    lazy var timeLabel: UILabel = {
      let label = UILabel()
      label.text = "#2,456,890.21"
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20.0)
      return label
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "56B6E016-F020-4D2B-96FB-88F4C6FFCBEA_1_105_c")
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // MARK: - button to display sessions
    lazy var transactionButton: UIButton = {
      let button = UIButton()
        button.setTitle("Transaction", for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.1725, green: 0.1176, blue: 0.1529, alpha: 1.0)
        button.layer.cornerRadius = 12
      return button
    }()
    
    lazy var cardsButton: UIButton = {
      let button = UIButton()
        button.setTitle("Cards", for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.1725, green: 0.1176, blue: 0.1529, alpha: 1.0)
        button.layer.cornerRadius = 12
      return button
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
      view.addSubview(imageView)
      view.addSubview(transactionButton)
        view.addSubview(cardsButton)
    }
    // MARK: - function to constrian all sub view
    func constraintViews() {
      addDefaultViews()
      self.navigationItem.setHidesBackButton(true, animated: true)
        tableView.anchorWithConstantsToTop(top: transactionButton.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 70, leftConstant: 0, bottomConstant: 0, rightConstant: 10)
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        imageView.bottomAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: -10),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        sleepBetterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
        sleepBetterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        sleepBetterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        sleepBetterView.heightAnchor.constraint(equalToConstant: 120),
        nameLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 26),
        nameLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 85),
        timeLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 71),
        timeLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 85),
        transactionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 ),
        transactionButton.topAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 60),
        transactionButton.heightAnchor.constraint(equalToConstant: 42),
        transactionButton.widthAnchor.constraint(equalToConstant: 170),
        cardsButton.leadingAnchor.constraint(equalTo: transactionButton.trailingAnchor, constant: 40),
        cardsButton.topAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 60),
        cardsButton.widthAnchor.constraint(equalToConstant: 130),
        cardsButton.heightAnchor.constraint(equalToConstant: 42)
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
        let cellItem = data[indexPath.row]
        switch cellItem.title {
        case "Settings":
            let vc = SettingsViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        default: break
            
        }
        
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

