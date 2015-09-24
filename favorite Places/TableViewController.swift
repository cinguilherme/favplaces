//
//  TableViewController.swift
//  favorite Places
//
//  Created by Gulherme Cintra on 23/09/15.
//  Copyright (c) 2015 Gulherme Cintra. All rights reserved.
//

import UIKit

var favoritePlaces = [Dictionary<String,String>()]

var selectedPlace = -1

class TableViewController: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("mytableview didload just called")
        
        if favoritePlaces.count == 1 {
            favoritePlaces.removeAtIndex(0)
            favoritePlaces.append(["name":"Taj Mahal","lat":"40","lon":"40"])
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("places") != nil {
                favoritePlaces = NSUserDefaults.standardUserDefaults().objectForKey("places") as! [Dictionary<String,String>]
                println("just recovered favorite places from NSUserDefa")
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        println("reload?")
        myTableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePlaces.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        var cellPlace = favoritePlaces[indexPath.row]
        
        cell.textLabel?.text = cellPlace["name"]
        
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
            selectedPlace = indexPath.row
        } else {
            selectedPlace = -1
        }
    }
    

}
