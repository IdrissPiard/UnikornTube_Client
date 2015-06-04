//
//  ViewController.swift
//  UnikornTube
//
//  Created by Serveur Maison on 16/02/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let videos = [["toto", "titi", "tutu"], ["tata", "tete", "tyty"]]
        
        println(videos)
        
        for video in videos {
            println(video)
        }*/

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            var destination = segue.destinationViewController as! AVPlayerViewController
            var url = NSURL(string: "http://192.168.200.40:9000/video/3/stream")
            destination.player = AVPlayer(URL: url)
    }


}

