//
//  MutliPlayerCardSelect.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/23/21.
//

import UIKit
import Firebase
class MutliPlayerCardSelect: UIViewController {
    var sliderNum: Int!
    var userName: String!
    var player1Name: String!
    var player2Name: String!
    var player3Name: String!
    var player4Name: String!
    var player5Name: String!
    var player6Name: String!
    override func viewDidLoad() {
        createParty()
        super.viewDidLoad()
    }
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderVal: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBAction func Slider(_ sender: UISlider) {
        self.sliderNum = Int(sender.value)
        sliderVal.text = String(self.sliderNum!)
        let db = Firestore.firestore()
        db.collection("currGames").document("\(self.currNum ?? 000)").setData(["numberOfCards": self.sliderNum as Int], merge: true)
    }
    @IBAction func buttonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "DeckOfCards", sender: self)
        
    }
    @IBOutlet weak var player5: UILabel!
    
    @IBOutlet weak var player6: UILabel!
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var gameID: UILabel!
    @IBOutlet weak var player2: UILabel!
    
    override func prepare(for segue:  UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DeckOfCardsVC
        destinationVC.numCards = (self.sliderNum ?? 1)
    }

    var currNum : Int!
    
    func updateCurrPlayers() {
        let db = Firestore.firestore()
        var docRef = db.collection("currGames").document("\(String(self.currNum ?? 0))")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                var property = document.get("user1") ?? ""
                self.player1Name = (property as! String)
                property = document.get("user2") ?? ""
                self.player2Name = (property as! String)
                property = document.get("user3") ?? ""
                self.player3Name = (property as! String)
                property = document.get("user4") ?? ""
                self.player4Name = (property as! String)
                property = document.get("user5") ?? ""
                self.player5Name = (property as! String)
                property = document.get("user6") ?? ""
                self.player6Name = (property as! String)
            } else {
                print("Document does not exist")
            }
        }
        if(player1Name != nil) {
            docRef = db.collection("users").document(player1Name ?? "")
            docRef.getDocument { [self] (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.userName = data["username"] as? String ?? ""
                        player1.text = self.userName
                    }
                }
            }
        }
        if(player2Name != nil) {
            docRef = db.collection("users").document(player1Name ?? "")
            docRef.getDocument { [self] (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.userName = data["username"] as? String ?? ""
                        player2.text = self.userName
                    }
                }
            }
        }
        if(player3Name != nil) {
            docRef = db.collection("users").document(player1Name ?? "")
            docRef.getDocument { [self] (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.userName = data["username"] as? String ?? ""
                        player3.text = self.userName
                    }
                }
            }
        }
        if(player4Name != nil) {
            docRef = db.collection("users").document(player1Name ?? "")
            docRef.getDocument { [self] (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.userName = data["username"] as? String ?? ""
                        player4.text = self.userName
                    }
                }
            }
        }
    }
    
    func createParty() {
        let db = Firestore.firestore()
        var docRef = db.collection("games").document("games_#")
        let userID = Auth.auth().currentUser!.uid
        docRef.getDocument { [self] (document, error) in
                guard error == nil else {
                    print("error", error ?? "")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.currNum = data["currNumber"] as? Int ?? 0
                        self.currNum += 1
                        gameID.text = ("\(self.currNum ?? 909)")
                    }
                }
               
                db.collection("games").document("games_#").setData(["currNumber": self.currNum ?? 0])
                db.collection("users").document(userID).setData(["currGame": self.currNum ?? 0], merge: true)
                db.collection("currGames").document("\(self.currNum ?? 000)").setData(["user1": userID, "user2": "", "user3": "", "user4": "", "user5": "", "user6": "", "numberOfPeople": 1, "numberOfCards":0, "cards_dealt": [String]()], merge: true)
                docRef = db.collection("users").document("\(userID)")
                docRef.getDocument { [self] (document, error) in
                    guard error == nil else {
                        print("error", error ?? "")
                        return
                    }
                    if let document = document, document.exists {
                        let data = document.data()
                        if let data = data {
                            self.userName = data["username"] as? String ?? ""
                            player1.text = self.userName
                        }
                    }
                }
        }
        updateCurrPlayers()
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
