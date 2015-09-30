//
//  SaveInforation.swift
//  RPS
//
//  Created by Anas Belkhadir on 30/09/2015.
//  Copyright © 2015 Anas Belkhadir. All rights reserved.
//

import Foundation

class SaveInformation{
    let message:String!
    let information:String!
    let nameOfImage:String!
    
    init(message: String,information: String, nameOfImage: String){
        self.message = message
        self.information = information
        self.nameOfImage = nameOfImage
    }
}