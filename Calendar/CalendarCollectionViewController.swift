//
//  CalendarCollectionViewController.swift
//  Calendar
//
//  Created by Nikhil on 08/09/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
struct CalendarConstant
{
    static let dayArray = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
}
class CalendarCollectionViewController: UICollectionViewController {
    var date = Date()
    var numberOfDays = 0
    var firstDay = 0
    var day = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "DayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout
        {
           let width = (UIScreen.main.bounds.width - 10 )/8
            layout.itemSize = CGSize(width: width, height: width)
            layout.invalidateLayout()
        }
        let range = Calendar.current.range(of: .day, in: .month, for: date)
        numberOfDays = range?.count ?? 0
        var dateComponents = Calendar.current.dateComponents([.month,.year], from: date)
        dateComponents.day = 1
        
        if let firstDate = Calendar.current.date(from: dateComponents)
        {
            let dayOfTheWeek = Calendar.current.component(.weekday, from: firstDate)
            firstDay = dayOfTheWeek - 1 
        }
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0
        {
            return 7

        }
        return numberOfDays  + firstDay
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let dayCell = cell as? DayCollectionViewCell
        {
            if indexPath.section == 0
            {
                dayCell.dayLabel.text = CalendarConstant.dayArray[indexPath.row]

            }
            else
            {
                if firstDay == 0
                {
                    dayCell.dayLabel.text = "\(day)"
                    day += 1

                }
                else
                {
                    firstDay -= 1
                }
            }
        }
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
