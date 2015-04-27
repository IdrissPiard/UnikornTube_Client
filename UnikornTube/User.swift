//
//  User.swift
//  UnikornTube
//
//  Created by Damien Serin on 27/04/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var id : Int
    var username : String
    var email : String
    var channelName : String
    var profilImgUrl : String
    
    init(id: Int, username: String, email: String, channelName : String, profilImgUrl: String) {
        self.id = id
        self.username = username
        self.email = email
        self.channelName = channelName
        self.profilImgUrl = profilImgUrl
    }
    
}
