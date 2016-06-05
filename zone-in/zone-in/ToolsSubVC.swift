//
//  ToolsSubVC.swift
//  zone-in
//
//  Created by Rean on 2/18/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class ToolsSubVC: UIViewController, UIPageViewControllerDataSource {
    
//    var pageVC = UIPageViewController()
    var pageVC = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    var buttonTitles = ["1", "2", "3", "4", "5", "6", "7"]
    var indexes: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clearColor()
        
//        self.pageVC = self.storyboard?.instantiateViewControllerWithIdentifier("StorePageVC") as! UIPageViewController
        indexes = ((buttonTitles.count + 3) / 4)
        self.pageVC.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)// as StoreContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageVC.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageVC.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.size.height)
        
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMoveToParentViewController(self)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentVC {
        if ((self.buttonTitles.count == 0) || (index >= indexes)) {
            return ContentVC()
        }
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("StoreContentVC") as! ContentVC
        
        if index >= 0 && index < (self.indexes! - 1) {
            vc.buttonTextArray = Array(buttonTitles[(index*4)...((index + 1)*4) - 1])
            vc.pageIndex = index

        }
        else if index == (self.indexes! - 1) {
            vc.buttonTextArray = Array(buttonTitles[(index*4)...(buttonTitles.count - 1)])
            vc.pageIndex = index
        }
        
        return vc
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentVC
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentVC
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        if (index == self.indexes) {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        print(self.buttonTitles.count / 4)
        return self.indexes!
    }
}
