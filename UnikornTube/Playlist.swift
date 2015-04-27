//
//  Playlist.swift
//  UnikornTube
//
//  Created by Damien Serin on 27/04/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class Playlist: NSObject {
    
    var id : Int
    var idUser : Int
    var title : String
    var videoList : [Video]
    
    init(id : Int, idUser: Int, title: String, videoList: [Video]) {
        self.id = id
        self.idUser = idUser
        self.title = title
        self.videoList = videoList
    }
}
