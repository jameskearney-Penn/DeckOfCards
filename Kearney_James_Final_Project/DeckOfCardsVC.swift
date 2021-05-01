//
//  DeckOfCardsVC.swift
//  Kearney_James_Final_Project
//
//  Created by Jake Kearney on 4/1/21.
//

import UIKit

class DeckOfCardsVC: UIViewController, UIGestureRecognizerDelegate {

    var cardView: UIView!
    var back: UIImageView!
    var front: UIImageView!
    var nextFront: UIImageView!
    var randomNumber: Int!
    var cardString: String!
    var numCards: Int!
    var cards : ArraySlice<String>!
    
    var cardsAll = ["AC", "AD", "AH", "AS", "KC", "KD", "KH", "KS", "QC", "QD", "QH", "QS", "JC", "JD", "JH", "JS", "10C", "10D", "10H", "10S", "9C", "9D", "9H", "9S", "8C", "8D", "8H", "8S", "7C", "7D", "7H", "7S", "6C", "6D", "6H", "6S", "5C", "5D", "5H", "5S", "4C", "4D", "4H", "4S", "3C", "3D", "3H", "3S", "2C", "2D", "2H", "2S"]


    
    var showingBack = true
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsAll.shuffle()
        cards = cardsAll[0...numCards]
        
        randomNumber = Int.random(in: 0...(numCards - 1))
        cardString = self.cards[randomNumber]
        
            
        front = UIImageView(image: UIImage(named: cardString))
        front.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
        back = UIImageView(image: UIImage(named: "gray_back"))
        back.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
        
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(DeckOfCardsVC.tapped))
        singleTap.numberOfTapsRequired = 1
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(DeckOfCardsVC.swipedRight))
        rightSwipe.direction = .right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(DeckOfCardsVC.leftSwiped))
        leftSwipe.direction = .left
                    
        let rect = CGRect(x: 10, y: 45, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        cardView = UIView(frame: rect)
        cardView.addGestureRecognizer(singleTap)
        cardView.addGestureRecognizer(rightSwipe)
        cardView.addGestureRecognizer(leftSwipe)
        cardView.isUserInteractionEnabled = true
        cardView.addSubview(back)
            
        view.addSubview(cardView)
    }
    
    @objc func swipedRight() {
        if (randomNumber == numCards) {
            randomNumber = 0;
        }
        if (!showingBack) {
            randomNumber += 1
            cardString = self.cards[randomNumber]
            nextFront = UIImageView(image: UIImage(named: cardString))
            nextFront.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
            UIView.transition(from: front, to: nextFront, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
            front = nextFront
        } else {
            randomNumber += 1
            cardString = self.cards[randomNumber]
            nextFront = UIImageView(image: UIImage(named: cardString))
            nextFront.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
            front = nextFront
        }
    }
    
    @objc func leftSwiped() {
        if (randomNumber == 0) {
            randomNumber = numCards;
        }
        if (!showingBack) {
            randomNumber -= 1
            cardString = self.cards[randomNumber]
            nextFront = UIImageView(image: UIImage(named: cardString))
            nextFront.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
            UIView.transition(from: front, to: nextFront, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
            front = nextFront
        } else {
            randomNumber -= 1
            cardString = self.cards[randomNumber]
            nextFront = UIImageView(image: UIImage(named: cardString))
            nextFront.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width - 15, height: UIScreen.main.bounds.size.height - 120)
            front = nextFront
        }
    }

    
    
    @objc func tapped() {
        if (showingBack) {
            UIView.transition(from: back, to: front, duration: 1, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
            showingBack = false
        } else {
            UIView.transition(from: front, to: back, duration: 1, options: UIView.AnimationOptions.transitionFlipFromLeft, completion: nil)
                showingBack = true
        }

    }

}
