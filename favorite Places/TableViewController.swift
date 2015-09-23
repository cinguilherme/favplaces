//
//  TableViewController.swift
//  favorite Places
//
//  Created by Gulherme Cintra on 23/09/15.
//  Copyright (c) 2015 Gulherme Cintra. All rights reserved.
//

import UIKit

var favoritePlaces:NSMutableArray = NSMutableArray()

var selectedPlace:Place = Place()

class TableViewController: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var home:Place = Place()
        home.name = "Home"
        home.latitude = 40
        home.longitude = -2
        favoritePlaces.addObject(home)
        var otherHome = Place()
        otherHome.name = "Home somewhere else"
        otherHome.latitude = 35
        otherHome.longitude = -2
        favoritePlaces.addObject(otherHome)
        
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
        return favoritePlaces.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        var cellPlace = favoritePlaces[indexPath.row] as! Place
        cell.textLabel?.text = cellPlace.name
        println("\(cellPlace.latitude) \(cellPlace.longitude)")
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (sender as? UITableViewCell != nil) {
            var cell: UITableViewCell = sender as! UITableViewCell
            var indexPath:NSIndexPath = myTableView.indexPathForCell(cell)!
            selectedPlace = favoritePlaces[indexPath.row] as! Place
            
        } else {
            selectedPlace = favoritePlaces[0] as! Place
        }
    }
    

}
