//
//  HomeworkTableViewController.swift
//  St.Marys
//
//  Created by Aaron Rosenberg on 11/8/14.
//  Copyright (c) 2014 Aaron Rosenberg. All rights reserved.
//

import UIKit

class HomeworkTableViewController: UITableViewController, SycamoreDelegate {
    
    
    var homeworkAssignments = [Homework]()
    
    var studentId = ""
    
    var sycInst = Sycamore()
    
    //MARK: Sycamore Delagate
    func sycamoreDataReceived(data: AnyObject?, dataTitle: String) {
        
        
        if dataTitle == "Me"{
            if let meData = data as? [String:AnyObject]{
                self.studentId = meData["StudentID"] as! String
                self.sycInst.getHomework("\(self.studentId)")
            }
        }
        else if dataTitle == "Homework"{
            println("\(data)")
            self.homeworkAssignments.removeAll(keepCapacity: true)
            
            if let homeworkData = data as? [[String:AnyObject]]{
                for homework in homeworkData{
                    println("HOMEWORK : \(homework)")
                    
                    let thisHomework = Homework( subject: homework["Subject"] as? String ?? "subject", assignment: homework["Assignment"] as? String ?? "0", due: homework["Due"]! )
                    self.homeworkAssignments.append(thisHomework)
                    self.tableView!.reloadData()
                }
                
            }
        }
    }
    
    func tokenReceived() {
        //
        self.sycInst.getMe()
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return homeworkAssignments.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HW", forIndexPath: indexPath) as! HomeworkTableViewCell

        // Configure the cell...
        cell.Subject.text = homeworkAssignments[indexPath.row].subject
        cell.Assignment.text = homeworkAssignments[indexPath.row].assignment
        cell.Due.text = homeworkAssignments[indexPath.row].due as? String

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
