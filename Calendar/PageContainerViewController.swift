//
//  PageContainerViewController.swift
//  Calendar
//
//  Created by Nikhil on 08/09/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class PageContainerViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    var pageViewController:CalendarPageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleLabel(date: Date())
        // Do any additional setup after loading the view.
    }
    func setTitleLabel(date:Date)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        labelTitle.text = dateFormatter.string(from: date)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? CalendarPageViewController
        {
            pageViewController = destination
        }
    }
    
    @IBAction func nextOrPrevious(_ sender: UIButton) {
        if var date = pageViewController?.date
        {    var direction:UIPageViewController.NavigationDirection!
            if sender.tag == 1
            {
                direction = .forward
                date = Calendar.current.date(byAdding: .month, value: 1, to: date) ?? date
               
            }
            else
            {
                direction = .reverse

                date = Calendar.current.date(byAdding: .month, value: -1, to: date) ?? date
            }
            self.setTitleLabel(date: date)
            pageViewController?.date = date
            if let calendarController = CalendarCollectionContainerViewController.getCalendarContainerController(date: date)
            {
                 pageViewController?.setViewControllers([calendarController], direction: direction, animated: true, completion: nil)
            }
           
        }
        
    }
    
}
