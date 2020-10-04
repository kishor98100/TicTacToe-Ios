//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Kishor Mainali on 10/4/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var activePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    var selectedButtons = [UIButton]()

    @IBAction func btnSelect(_ sender: Any) {
        let selectButton = sender as! UIButton
        selectedButtons.append(selectButton)
        playGame(selectButton)
    }
    
    func playGame(_ buSelect:UIButton){
        if activePlayer==1{
            buSelect.setTitle("X",for:UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 102/255, green: 250/255, blue:51/255, alpha: 0.5)
            player1.append(buSelect.tag)
            activePlayer = 2
            
        }else{
            buSelect.setTitle("O",for:UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 16/255, green: 58/255, blue:57/255, alpha: 0.85)
            player2.append(buSelect.tag)
            activePlayer = 1
            
        }
        buSelect.isEnabled=false
        findWinner()
        
    }
    
    func findWinner(){
        var winner = -1
        //row1
        if player1.contains(1) && player1.contains(2) && player1.contains(3) {
            winner = 1
        }
        if player2.contains(1) && player2.contains(2) && player2.contains(3) {
            winner = 2
        }
        //row2
        if player1.contains(4) && player1.contains(5) && player1.contains(6) {
            winner = 1
        }
        if player2.contains(4) && player2.contains(5) && player2.contains(6) {
            winner = 2
        }
        //row3
        if player1.contains(7) && player1.contains(8) && player1.contains(9) {
            winner = 1
        }
        if player2.contains(7) && player2.contains(8) && player2.contains(9) {
            winner = 2
        }
        //column1
        if player1.contains(1) && player1.contains(4) && player1.contains(7) {
            winner = 1
        }
        if player2.contains(1) && player2.contains(4) && player2.contains(7) {
            winner = 2
        }
        //column2
        if player1.contains(2) && player1.contains(5) && player1.contains(8) {
            winner = 1
        }
        if player2.contains(2) && player2.contains(5) && player2.contains(8) {
            winner = 2
        }
        //column3
        if player1.contains(3) && player1.contains(6) && player1.contains(9) {
            winner = 1
        }
        if player2.contains(3) && player2.contains(6) && player2.contains(9) {
            winner = 2
        }
        //diagnol1
        if player1.contains(1) && player1.contains(5) && player1.contains(9) {
            winner = 1
        }
        if player2.contains(1) && player2.contains(5) && player2.contains(9) {
            winner = 2
        }
        //diagnol2
        if player1.contains(3) && player1.contains(5) && player1.contains(7) {
            winner = 1
        }
        if player2.contains(3) && player2.contains(5) && player2.contains(7) {
            winner = 2
        }
        
        if winner != -1 {
            var message:String?
            if winner==1{
                message = "Player 1 is Winner"
            }else{
                message  = "Player 2 is Winner"
            }
            let alert = UIAlertController(title: "Winner", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(
                title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
                    for button in self.selectedButtons{
                        button.setTitle("", for: UIControl.State.normal)
                        button.isEnabled = true
                        button.backgroundColor = UIColor.white
                    }
                    self.player1 = []
                    self.player2 = []
                    self.activePlayer=1
                }
            ))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

