//
//  RPSViewController.swift
//  RPS
//
//  Created by Anas Belkhadir on 29/09/2015.
//  Copyright © 2015 Anas Belkhadir. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {

    var recivedInformation:SaveInformation!
    
    enum RPS  {
        case Paper
        case Rock
        case Scissors
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    func setMove(choice: Int) ->RPS{
        let move: RPS
        switch choice {
            case 0:
                move = .Paper
            case 1:
                move = .Rock
            default:
                move = .Scissors
        }
        return move
    }
    
    func computerMakeAChoice() -> RPS {
        let choice:Int = generateRandomly()
        return setMove(choice)
    }
    
    @IBAction func userMakeAChoice(sender: UIButton) {
        let userMove:RPS = setMove(sender.tag)
        let computerMove:RPS = computerMakeAChoice()
        let message :String = winner(userMove, computerChoice: computerMove)
        let (information, nameOfImage) = informationAboutTheGame(userMove, secondMove: computerMove)
        recivedInformation = SaveInformation(message: message, information: information, nameOfImage: nameOfImage)
        
        performSegueWithIdentifier("moveTo", sender: recivedInformation)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "moveTo" {
            let winecCV:WinerViewController = segue.destinationViewController as! WinerViewController
            let data = sender as! SaveInformation
            winecCV.recivedInfoirmation = data
        }
    }

    func generateRandomly() -> Int {
        return Int( random() % 3)
    }
    
    func informationAboutTheGame(firstMove: RPS, secondMove: RPS) ->(String, String){
        let information:String
        let nameOfImage:String
        switch (firstMove,secondMove){
            case (.Paper, .Rock), (.Rock,.Paper):
                information = "Paper cover Rock"
                nameOfImage = "PaperCoverRock"
            case (.Paper, .Scissors),(.Scissors, .Paper) :
                information = "Scissors cut paper"
                nameOfImage = "ScissorsCutPaper"
            case (.Rock, .Scissors), (.Scissors, .Rock):
                information = "Rock crushes scussors "
                nameOfImage = "RockCrushesScissors"
            default :
                information = ""
                nameOfImage = "itsATie"
        }
        return (information, nameOfImage)
    }
    
    func winner(userChoice: RPS, computerChoice: RPS) -> String {
        let message :String
        switch (userChoice,computerChoice){
            case let (x,y) where x==y :
                message = "Tied!"
        case (.Paper, .Rock), (.Rock, .Scissors), (.Scissors, .Paper):
                message = "Winer"
        default:
            message = "looser"
        }
        return message
    }

}

