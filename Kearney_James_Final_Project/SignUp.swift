//
//  SignUp.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/22/21.
//

import UIKit
import Firebase
class SignUp: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        if password.text != passwordConfirm.text && (password.text != nil) {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
                    }
        else{
            Auth.auth().createUser(withEmail:  email.text!, password: password.text!){ (user, error) in
            if error == nil {
                let db = Firestore.firestore()
                let userID = Auth.auth().currentUser!.uid
                db.collection("users").document(userID).setData(["email": self.email.text ?? "FAIL", "username": self.username.text ?? "FAIL"], merge: true)
                self.email.text?.removeAll()
                self.password.text?.removeAll()
                self.username.text?.removeAll()
                self.passwordConfirm.text?.removeAll()
                self.performSegue(withIdentifier: "MainMenu", sender: self)
                            }
             else{
               let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
