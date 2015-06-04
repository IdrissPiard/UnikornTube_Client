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
    var videoURL: String
    var vidDescription: String
    var comments: [Comment]
    var totalView: Int
    var totalLike: Int
    var totalDislike: Int
    var userID: Int 
    
    init(id: Int, title: String, coverURL: String, videoURL: String, vidDescription: String, comments: [Comment], totalView: Int, totalLike: Int, totalDislike: Int, userID: Int) {
        
        self.id = id
        self.title = title
        self.coverURL = coverURL
        self.videoURL = videoURL
        self.vidDescription = vidDescription
        self.comments = comments
        self.totalView = totalView
        self.totalLike = totalLike
        self.totalDislike = totalDislike
        self.userID = userID
    }
    
    init(id: Int, title: String, videoURL: String, totalView: Int, totalLike: Int, totalDislike: Int, userID: Int) {
        
        self.id = id
        self.title = title
        self.videoURL = videoURL
        self.totalView = totalView
        self.totalLike = totalLike
        self.totalDislike = totalDislike
        self.userID = userID
        self.coverURL = ""
        self.comments = []
        self.vidDescription = ""
    }
   
}
