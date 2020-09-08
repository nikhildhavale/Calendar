//
//  CalendarCollectionContainerViewController.swift
//  Calendar
//
//  Created by Nikhil on 08/09/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class CalendarCollectionContainerViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var date = Date()
    static func getCalendarContainerController(date:Date) -> CalendarCollectionContainerViewController?
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let collectionContainerController = storyBoard.instantiateViewController(withIdentifier: "CalendarCollectionContainerViewController") as? CalendarCollectionContainerViewController
        {
            collectionContainerController.date  = date
            return collectionContainerController
        }
        return nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        titleLabel.text = dateFormatter.string(from: date)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CalendarCollectionViewController
        {
            destination.date = date
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}
