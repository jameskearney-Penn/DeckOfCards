//
//  JoinParty.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 5/1/21.
//

import UIKit
import Firebase
class JoinParty: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var GameID: UITextField!
    
    override func prepare(for segue:  UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DeckOfCardsVC
        var numberOfPeople = 0
        destinationVC.numCards = 13
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser!.uid
        let docRef = db.collection("currGames").document(GameID.text!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("numberOfCards")
                destinationVC.numCards = (property as! Int)
                let numPeople = document.get("numberOfPeople")
                numberOfPeople = (numPeople as! Int)
                numberOfPeople += 1
                db.collection("currGames").document(self.GameID.text!).setData([ "user\(numberOfPeople)": userID, "numberOfPeople": numberOfPeople], merge: true)
            } else {
                print("Document does not exist")
                return
            }
        }
        
    }
    
    @IBAction func JoinGameButton(_ sender: Any) {
        self.performSegue(withIdentifier: "JoinDeckOfCards", sender: self)
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
