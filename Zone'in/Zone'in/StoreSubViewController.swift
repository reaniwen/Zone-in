//
//  StoreSubViewController.swift
//  Zone'in
//
//  Created by Rean on 10/27/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class StoreSubViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageVC: UIPageViewController = UIPageViewController()
    var buttonTitles = [["1", "2", "3", "4"], ["5", "6", "7"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        self.pageVC = self.storyboard?.instantiateViewControllerWithIdentifier("StorePageVC") as! UIPageViewController
        self.pageVC.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)// as StoreContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageVC.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageVC.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height)
        
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> StoreContentViewController {
        if ((self.buttonTitles.count == 0) || (index >= self.buttonTitles.count)) {
            return StoreContentViewController()
        }
        
        let vc: StoreContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("StoreContentVC") as! StoreContentViewController
        vc.buttonTextArray = buttonTitles[index]
        vc.pageIndex = index
        
        return vc
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! StoreContentViewController
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! StoreContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index++
        if (index == self.buttonTitles.count) {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.buttonTitles.count
    }

}
