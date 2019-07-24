//
//  Soccer.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/23/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import Foundation

class Result : Codable {
    var response : Soccer
}

class Soccers : Codable {
    var soccers : [Soccer]
}

class Soccer: Codable {
    
    var name : String = ""
    var fullName : String = ""
    var logo : String = ""
    var area : String = ""
    var city : String = ""
    var imageView : String = ""
    var email : String = ""
    var venue : String = ""
    var website : String = ""
    var globalID : String = ""
    
    
}
