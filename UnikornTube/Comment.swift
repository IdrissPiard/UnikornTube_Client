//
//  Comment.swift
//  UnikornTube
//
//  Created by Damien Serin on 27/04/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class Comment: NSObject {
    var id : Int
    var id_video : Int
    var id_user : Int
    var comment : String

    init(id : Int, id_video: Int, id_user: Int, comment: String) {
        self.id = id
        self.id_video = id_video
        self.id_user = id_user
        self.comment = comment
    }
}
