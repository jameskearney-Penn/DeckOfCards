//
//  MultiPlayerVC.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/23/21.
//

import UIKit

class MultiPlayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segue_to_joinParty(_ sender: Any) {
        self.performSegue(withIdentifier: "JoinPartySegue", sender: self)
    }
    
    @IBAction func MainMenu(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func StartAGame(_ sender: Any) {
        self.performSegue(withIdentifier: "CardSelectMulti", sender: self)
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
