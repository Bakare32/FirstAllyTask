//
//  SendMoneyViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 22/10/2021.
//

import UIKit
import RaveSDK

class SendMoneyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, RavePayProtocol {
    func tranasctionSuccessful(flwRef: String?, responseData: [String : Any]?) {}
    
    func tranasctionFailed(flwRef: String?, responseData: [String : Any]?) {}
    
    func onDismiss() {}
    

    let pickViewer: UIPickerView = {
       let pickview = UIPickerView()
        pickview.tintColor = .white
        pickview.translatesAutoresizingMaskIntoConstraints = false
        return pickview
    }()
    
    let firstLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.text = "0.00"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    let messageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.text = "How much dollar will you like to send?"
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    let emailTextField: LeftPaddedTextField = {
      let textField = LeftPaddedTextField()
      textField.layer.borderColor = UIColor.black.cgColor
      textField.translatesAutoresizingMaskIntoConstraints = false
      textField.layer.borderWidth = 1
      textField.keyboardType = .emailAddress
      textField.layer.cornerRadius = 5
      textField.autocapitalizationType = .none
      textField.placeholder = "Enter Your Amount:"
      textField.addTarget(self, action: #selector(updateViews), for: .editingChanged )
      return textField
    }()
    let sendMoneyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send Now", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(callFlutterWaveAPI), for: .touchUpInside)
        return button
    }()
    let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(previousPage), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(UIImage(named: "Go-back"), for: .normal)
      return button
    }()
    // MARK: - PAGE TITLE
    let pageTitleLabel: UILabel = {
      let label = UILabel()
      label.text = "Send Money"
      label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    var currenyCode: [String] = []
    var values: [Double] = []
    var activeCurrency: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpConstraint()
        fetchDataFromJson()
        pickViewer.dataSource = self
        pickViewer.delegate = self
    }
    
    @objc func updateViews(input: Double) {
        guard let amountText = emailTextField.text, let theAmountText = Double(amountText) else { return }
        
        if emailTextField.text != "" {
            let total = theAmountText * activeCurrency
            firstLabel.text = String(format: "%.2f", total)
        }
    }
  
    @objc func callFlutterWaveAPI() {
        let config = RaveConfig.sharedConfig()
                             config.country = "NG"
                             config.currencyCode = "NGN"
                             config.email = "[customer@email.com]"
                             config.isStaging = false
                             config.phoneNumber = "08102987179"
                             config.transcationRef = "ref"
                             config.firstName = "Waris"
                             config.lastName = "Bakare"
                             config.meta = [["metaname":"sdk", "metavalue":"ios"]]
        
                             config.publicKey = "FLWPUBK_TEST-fa51a0b283494ce091e565f77df529ea-X"
                             config.encryptionKey = "FLWSECK_TEST2e8c126430ce"         
        
                             let controller = NewRavePayViewController()
                             let nav = UINavigationController(rootViewController: controller)
        controller.amount = firstLabel.text
                             controller.delegate = self
                             self.present(nav, animated: true)
    }
    @objc func previousPage() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currenyCode.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currenyCode[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = values[row]
        updateViews(input: activeCurrency)
    }
    
    //MARK: - FETCH DATA
    
    func fetchDataFromJson() {
        
        guard let url = URL(string: "https://open.exchangerate-api.com/v6/latest") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            guard let safeData = data else { return }
            
            do {
                let results = try JSONDecoder().decode(ExchangeRate.self, from: safeData)
                print(results.rates)
                self.currenyCode.append(contentsOf: results.rates.keys)
                self.values.append(contentsOf: results.rates.values)
                DispatchQueue.main.async {
                    self.pickViewer.reloadAllComponents()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }

}

