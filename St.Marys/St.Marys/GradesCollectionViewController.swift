//
//  GradesCollectionViewController.swift
//  St.Marys
//
//  Created by Aaron Rosenberg on 11/1/14.
//  Copyright (c) 2014 Aaron Rosenberg. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class GradesCollectionViewController: UICollectionViewController, SycamoreDelegate {
    
    
    
    var grades = [Grade(className: "Science", grade: "C+", emoji: "😦"), Grade(className: "Math", grade: "B-", emoji: "😀")]
    //[Grade]()
    
    //MARK: Sycamore Delagate
    func sycamoreDataReceived(data: AnyObject?, dataTitle: String) {
        //
    }
    
    func tokenReceived() {
        //
    }
    
    //MARK: Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return grades.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GradeCell", forIndexPath: indexPath) as gradeSummaryCellCollectionViewCell
        
        cell.classLabel.text = grades[indexPath.row].className
        
        cell.gradeLabel.text = grades[indexPath.row].grade
        
        cell.emojiLabel.text = grades[indexPath.row].emoji
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
