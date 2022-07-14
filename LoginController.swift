//
//  LoginController.swift
//  newProject
//
//  Created by Vasif Mehdizade on 09.07.22.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var notRegisteredButton: UIButton!
    
    
    var loginModel = [StructLogin]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonSetup()
        
        
        let attributeString = NSMutableAttributedString(
            string: "Not registered",
            attributes: yourAttributes)
        
        notRegisteredButton.setAttributedTitle(attributeString, for: .normal)
        
    }
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    @IBAction func signInAction(_ sender: Any)  {
        let correct = check()
        print(correct)
        if correct {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TestController") as! TestController
            show(controller, sender: nil)
        }
    }
        
    
    @IBAction func notRegisteredAction(_ sender: Any) {
        
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpController
        show(controller, sender: nil)
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "StructLogin", withExtension: "json"), let data = try?
            Data(contentsOf: jsonFile) {
            do {
                loginModel = try JSONDecoder().decode([StructLogin].self, from: data)
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func check() ->Bool{
        print(loginModel)

        
        for user in loginModel {
            if(user.email == mailText.text && user.password == passwordText.text) {
                return true
            }
        }
        return false

    }

}




