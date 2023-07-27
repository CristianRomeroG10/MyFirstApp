//
//  SignUpViewController.swift
//  MyFirstApp
//
//  Created by Cristian guillermo Romero garcia on 25/07/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //Mark: Outlets
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var ageDescriptionLabel: UILabel!
    @IBOutlet weak var ageAlertLabel: UILabel!
    @IBOutlet weak var ageValueLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var ageSwitch: UISwitch!
    @IBOutlet weak var ageSlider: UISlider!
   
    
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setUpUI()
    }
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        print("vieDidAppear")
    }
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated:Bool){
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    private func setUpUI(){
        
        //MARK: Label
        titleLabel.text = "Photo Edit"
        signUpLabel.text = "Registrate"
        ageDescriptionLabel.text = "Soy mayor de edad"
        ageAlertLabel.text = "Ingresa tu edad"
        ageValueLabel.text = ""
        errorLabel.text = "Faltan Datos"
        
        //MARK: Logo Image
        logoImageView.image = UIImage(named: "Logo")
        logoImageView.layer.cornerRadius = logoImageView.bounds.height / 2
        logoImageView.clipsToBounds = true
        
        //MARK: Textfield
        nameTextField.placeholder = "Nombre"
        phoneTextField.placeholder = "Telefono"
        emailTextField.placeholder = "e-mail"
        
        //Mark: Slider
        ageSlider.isEnabled = false
        ageSlider.minimumValue = 18
        ageSlider.maximumValue = 90
        
        //MARK: Switch
        ageSwitch.isOn = false
        
        //MARK: Button
        
        confirmButton.isEnabled = false
        confirmButton.setTitle("Registrarme", for: .normal)
        
        //MARK: Error Label
        errorLabel.isHidden = true
    }
    
    //Mark: Actions
    
    @IBAction func ageSwitchChanged(_ sender: Any) {
        switchIsOn()
    }
    
    @IBAction func ageSliderChange(_ sender: Any) {
        print(ageSlider.value)
        ageValueLabel.text = "\(Int(ageSlider.value))"
    }
    
    
    @IBAction func didPressConfirmButton(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let phone = phoneTextField.text else{return}
        if name.isEmpty || email.isEmpty || phone.isEmpty{
            errorLabel.isHidden = true
            showErrorAlert()
        }else{
            errorLabel.isHidden = true
            let newUser = User(name: name, email: email, phone: phone, age: Int(ageSlider.value))
            presentFirstModule(withUser: newUser)
            
        }
        
    }
    
    //MARK: Funciones
    func switchIsOn(){
        if ageSwitch.isOn == false {
            ageSlider.isEnabled = false
            confirmButton.isEnabled = false
            ageSlider.value = 0
            ageValueLabel.text = ""
        }else{
            ageSlider.isEnabled = true
            confirmButton.isEnabled = true
        }
    }
    
    func presentFirstModule(withUser user: User){
        let firstStoryboard = UIStoryboard(name: "FirstStoryboard", bundle: .main)
        let firstViewController = firstStoryboard.instantiateViewController(identifier: "FirstVC")as! FirstViewController
        firstViewController.user = user
        let firstNavigation = UINavigationController(rootViewController: firstViewController)
        firstNavigation.modalPresentationStyle = .fullScreen
        self.present(firstNavigation,animated: true, completion: nil)
        
        
        
        
    }
    func showErrorAlert(){
        let errorTitle = "Error"
        let errorMessage = "LLena los campos Vacios!"
        let alertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        let aceptAction = UIAlertAction(title: "Aceptar", style: .default){_ in
            print("Did Select Acept !!")
        }
        alertController.addAction(aceptAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
}
