//
//  WinerViewController.swift
//  RPS
//
//  Created by Anas Belkhadir on 30/09/2015.
//  Copyright © 2015 Anas Belkhadir. All rights reserved.
//

import UIKit
import Foundation

class WinerViewController: UIViewController {
    
    var recivedInfoirmation:SaveInformation!
    
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var informationAboutTheGameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewImage.image = UIImage(named: recivedInfoirmation.nameOfImage)
        messageLabel.text = recivedInfoirmation.message
        informationAboutTheGameLabel.text = recivedInfoirmation.information
    }
    
    @IBAction func playAgain(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
