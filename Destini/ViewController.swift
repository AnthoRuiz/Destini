//
//  ViewController.swift
//  Destini
//
//  Created by Jakaboy on 5/1/18.
//  Copyright (c) 2018 Jakaboy. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController {

    // Our strings
   let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
   let answer1a = "I\'ll hop in. Thanks for the help!"
   let answer1b = "Better ask him if he\'s a murderer first."
   
   let story2 = "He nods slowly, unphased by the question."
   let answer2a = "At least he\'s honest. I\'ll climb in."
   let answer2b = "Wait, I know how to change a tire."
   
   let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
   let answer3a = "I love Elton John! Hand him the cassette tape."
   let answer3b = "It\'s him or me! You take the knife and stab him."
   
   let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
   let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
   let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
   
   let revealingSplashScreen = RevealingSplashView(iconImage: UIImage(named:"splash")!, iconInitialSize: CGSize(width:80, height:80), backgroundColor: UIColor.white)
   
   func splash(){
      self.view.addSubview(self.revealingSplashScreen)
      self.revealingSplashScreen.animationType = SplashAnimationType.popAndZoomOut
      self.revealingSplashScreen.startAnimation()
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      self.splash()
      stage(storyTex: story1, topTex: answer1a, botTex: answer1b)
      
    }

   func stage(storyTex: String, topTex: String, botTex: String) {
      storyTextView.text = storyTex
      topButton.setTitle(topTex, for: .normal)
      bottomButton.setTitle(botTex, for: .normal)
   }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
      if sender.tag == 1 && sender.titleLabel?.text == answer1a{
         stage(storyTex: story3, topTex: answer3a, botTex: answer3b)
      }else if sender.tag == 2 && sender.titleLabel?.text == answer1b{
         stage(storyTex: story2, topTex: answer2a, botTex: answer2b)
      }else if sender.tag == 1 && sender.titleLabel?.text == answer3a{
         stage(storyTex: story6, topTex: "finishTop", botTex: "finishBot")
         startOver()
      }else if sender.tag == 2 && sender.titleLabel?.text == answer3b{
         stage(storyTex: story5, topTex: "finishTop", botTex: "finishBot")
         startOver()
      }else if sender.tag == 1 && sender.titleLabel?.text == answer2a{
         stage(storyTex: story3, topTex: answer3a, botTex: answer3b)
      }else if sender.tag == 2 && sender.titleLabel?.text == answer2b{
         stage(storyTex: story4, topTex: "finishTop", botTex: "finishBot")
         startOver()
      }else if sender.tag == 1 && sender.titleLabel?.text == answer3a{
         stage(storyTex: story6, topTex: "finishTop", botTex: "finishBot")
         startOver()
      }else if sender.tag == 2 && sender.titleLabel?.text == answer3b{
         stage(storyTex: story5, topTex: "finishTop", botTex: "finishBot")
         startOver()
      }
      
    }
   
   func startOver() {
      let alert = UIAlertController(title: "Awesome", message: "Do you Want To Play Again?", preferredStyle: .alert)
      
      let restarStory = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
         
         self.stage(storyTex: self.story1, topTex: self.answer1a, botTex: self.answer1b)
      })
      alert.addAction(restarStory)
      present(alert, animated: true, completion: nil)
   }

}

