//
//  CalendarPageViewController.swift
//  Calendar
//
//  Created by Nikhil on 08/09/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        date = Calendar.current.date(byAdding: .month, value: -1, to: date) ?? date
        if let calendarController = CalendarCollectionContainerViewController.getCalendarContainerController(date: date)
        {
            return calendarController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        date = Calendar.current.date(byAdding: .month, value: 1, to: date) ?? date
        if let calendarController = CalendarCollectionContainerViewController.getCalendarContainerController(date: date)
        {
            return calendarController
        }
        return nil
    }
    
    var date = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let calendarController = CalendarCollectionContainerViewController.getCalendarContainerController(date: date)
        {
            self.setViewControllers([calendarController], direction: .forward, animated: true, completion: nil)
            self.dataSource = self
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
