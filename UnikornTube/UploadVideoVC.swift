//
//  UploadVideoVC.swift
//  UnikornTube
//
//  Created by Damien Serin on 03/06/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class UploadVideoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var coverImage: UIImageView!

    var videoPickerController = UIImagePickerController()
    var coverPickerController = UIImagePickerController()
    
    var moviePath : String!
    var coverUrl : NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func uploadButtonTapped(sender: AnyObject) {
        
        videoUploadRequest()
        
    }
    
    @IBAction func selectVideoButtonTapped(sender: AnyObject) {
        
        
        videoPickerController.allowsEditing = false
        videoPickerController.delegate = self;
        videoPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        videoPickerController.mediaTypes = [kUTTypeMovie as NSString]
        
        self.presentViewController(videoPickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func selectCoverButtonTapped(sender: AnyObject) {
        
        
        coverPickerController.allowsEditing = false
        coverPickerController.delegate = self;
        coverPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        coverPickerController.mediaTypes = [kUTTypeImage as NSString]
        
        self.presentViewController(coverPickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    {
        if picker == self.videoPickerController {
            var mediaType = info[UIImagePickerControllerMediaType] as! CFString!
            
            var compareResult = CFStringCompare(mediaType, kUTTypeMovie, CFStringCompareFlags.CompareCaseInsensitive)
        
            if(compareResult == CFComparisonResult.CompareEqualTo){
                var videoUrl = info[UIImagePickerControllerMediaURL] as! NSURL
            
                var moviePath = videoUrl.path
            
                if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)){
                    //UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil)
                }
                self.moviePath = moviePath
                println(self.moviePath)
            }
        }
        if picker == self.coverPickerController {
            var coverUrl = info[UIImagePickerControllerReferenceURL] as! NSURL
            var image = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.coverImage.image = image
            var coverPath = coverUrl.path
            self.coverUrl = coverUrl
            println(self.coverUrl)
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func videoUploadRequest(){
        //var json: JSON =  ["meta_data": ["title":"titre", "idUser":"42", "description":"desc"]]
        let manager = AFHTTPRequestOperationManager()
        let url = "http://192.168.200.40:9000/upload"
        manager.requestSerializer = AFJSONRequestSerializer(writingOptions: nil)
        var videoURL = NSURL.fileURLWithPath(self.moviePath)
        var imageData = UIImageJPEGRepresentation(self.coverImage.image, CGFloat(1))
        println(videoURL)
        
        var params = ["meta_data" : "{\"title\":\"titre\", \"idUser\":42, \"description\":\"ladesc\"}"]
        var json : String = "{ \"meta_data\" : [{\"title\":\"titre\", \"idUser\":42, \"description\":\"ladesc\"}]}"
        println(json)
        AFNetworkActivityLogger.sharedLogger().level = AFHTTPRequestLoggerLevel.AFLoggerLevelDebug
        manager.POST( url, parameters: params,
            constructingBodyWithBlock: { (data: AFMultipartFormData!) in
                
                var res = data.appendPartWithFileURL(videoURL, name: "video_data", error: nil)
                data.appendPartWithFileData(imageData, name: "cover_data", fileName: "cover.jpg", mimeType: "image/jpeg")
                println("was file added properly to the body? \(res)")
            },
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("Yes thies was a success")
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("We got an error here.. \(error)")
                println(operation.responseString)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
