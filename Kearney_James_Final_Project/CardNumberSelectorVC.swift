//
//  CardNumberSelectorVC.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/22/21.
//

import UIKit


class CardNumberSelectorVC: UIViewController {
    var sliderNum: Int!

    
    @IBOutlet weak var sliderVal: UILabel!
    @IBAction func Slider(_ sender: UISlider) {
        self.sliderNum = Int(sender.value)
        sliderVal.text = String(self.sliderNum!)
        
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "DeckOfCards", sender: self)
        
    }
    
    override func prepare(for segue:  UIStoryboardSegue, sender: Any?) {
        print("GOOD")
        let destinationVC = segue.destination as! DeckOfCardsVC
        destinationVC.numCards = (self.sliderNum ?? 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
