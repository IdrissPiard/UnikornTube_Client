//
//  Video.swift
//  UnikornTube
//
//  Created by Damien Serin on 27/04/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var id : Int
    var title: String
    var coverURL: String
    var videoURL : String
    var totalView: Int
    var totalLike: Int
    var totalDislike: Int
    var userID: Int
    
    init(id: Int, title: String, coverURL: String, videoURL: String, totalView: Int, totalLike: Int, totalDislike: Int, userID: Int) {
        
        self.id = id
        self.title = title
        self.coverURL = coverURL
        self.videoURL = videoURL
        self.totalView = totalView
        self.totalLike = totalLike
        self.totalDislike = totalDislike
        self.userID = userID
    }
   
}
