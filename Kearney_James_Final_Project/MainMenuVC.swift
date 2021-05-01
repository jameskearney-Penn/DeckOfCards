//
//  MainMenuVC.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/2/21.
//

import UIKit
protocol MainMenuDelegate: class {
}

class MainMenuVC: UIViewController {
    
    weak var delegate: MainMenuDelegate?
    

    
    @IBAction func SignOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segue_to_DeckOfCards(_ sender: Any) {
        self.performSegue(withIdentifier: "CardNumberSelector", sender: self)
    }
    
    @IBAction func MultiPlayer(_ sender: Any) {
        self.performSegue(withIdentifier: "MultiPlayer", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.view.shadowColor = UIColor.black
        // Do any additional setup after loading the view.
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
