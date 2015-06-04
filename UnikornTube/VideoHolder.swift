//
//  VideoHolder.swift
//  UnikornTube
//
//  Created by Damien Serin on 02/06/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class VideoHolder: NSObject {
    
    var videos : [Video]
    
    override init(){
        self.videos = [Video]()
    }
    
    func loadLatest(view : UITableView){
        request(.GET, Constants.Server.baseUrl+"video/last")
            .responseJSON { (request, response, data, error) in
                var json = JSON(data!)
                for (index, video) in json {
                    var vid = Video(id: video["id"].int!, title: video["title"].stringValue, videoURL: video["link"].stringValue, totalView: video["nbView"].int!, totalLike: video["nbLike"].int!, totalDislike: video["nbDislike"].int!, userID: video["idUser"].int!)
                    self.videos.append(vid)
                    view.reloadData()
                    println(" in \(self.videos)")
                }
        }

    }
   
}
