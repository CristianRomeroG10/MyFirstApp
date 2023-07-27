//
//  FirstViewController.swift
//  MyFirstApp
//
//  Created by Cristian guillermo Romero garcia on 25/07/23.
//

import UIKit

class FirstViewController: UIViewController{
    //MARK: Properties
    var user = User(name: "", email: "", phone: "", age: 0)
    
    //MARK: Outlets
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageDescriptionLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var modalButton: UIButton!
    @IBOutlet weak var pushButton: UIButton!
    
    

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
    
    func setUpUI(){
        
        helloLabel.text = "Holaa"
        nameLabel.text = user.name
        ageDescriptionLabel.text = "Tus datos registrados son:"
        ageLabel.text = "EDAD: \(user.age) años"
        emailLabel.text = "EMAIl: \(user.email)"
        numberLabel.text = "TELEFONO: \(user.phone)"
        
    }
    
    @IBAction func ModalbuttonPressed(_ sender: Any) {
        let modalStoryboard = UIStoryboard(name: "ModalStoryboard", bundle: .main)
        let modalViewController = modalStoryboard.instantiateViewController(withIdentifier: "ModalVC")as! ModalViewController
       // modalViewController.modalPresentationStyle = .fullScreen
        self.present(modalViewController,animated: true, completion: nil)
        modalViewController.navigationItem.title = "Pantalla Modal"
        
    }
    
    @IBAction func pushButtonPressed(_ sender: Any) {
        let pushStoryboard = UIStoryboard(name: "PushStoryboard", bundle: .main)
        let pushViewController = pushStoryboard.instantiateViewController(withIdentifier: "PushVC")as! PushViewController
        self.navigationController?.pushViewController(pushViewController, animated: true)
        
        
    }
    
}
