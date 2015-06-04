//
//  HomeTableVC.swift
//  UnikornTube
//
//  Created by Damien Serin on 27/04/2015.
//  Copyright (c) 2015 SimpleAndNew. All rights reserved.
//

import UIKit

class HomeTableVC: UITableViewController, ENSideMenuDelegate  {
    
    var holder = VideoHolder()
    override func viewDidLoad() {
        holder.loadLatest(self.tableView)



        
        self.sideMenuController()?.sideMenu?.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return holder.videos.count
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> VideoListCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeVideoCell", forIndexPath: indexPath) as! VideoListCell

        var video : Video = holder.videos[indexPath.row]
        cell.title.text = String(video.title)
        println(cell.title.text)
        cell.nbDislike.text = String(video.totalDislike)
        cell.nbLike.text = String(video.totalLike)
        cell.totalView.text = String(video.totalView)
        return cell
    }

    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        println("sideMenuShouldOpenSideMenu")
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
