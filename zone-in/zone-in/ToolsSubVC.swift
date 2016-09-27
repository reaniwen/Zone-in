//
//  ToolsSubVC.swift
//  zone-in
//
//  Created by Rean on 2/18/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class ToolsSubVC: UIViewController, UIPageViewControllerDataSource {
    
//    var pageVC = UIPageViewController()
    var pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    var buttonTitles = ["1", "2", "3", "4", "5", "6", "7"]
    var indexes: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
//        self.pageVC = self.storyboard?.instantiateViewControllerWithIdentifier("StorePageVC") as! UIPageViewController
        indexes = ((buttonTitles.count + 3) / 4)
        self.pageVC.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)// as StoreContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageVC.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
        self.pageVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.size.height)
        
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(_ index: Int) -> ContentVC {
        if ((self.buttonTitles.count == 0) || (index >= indexes)) {
            return ContentVC()
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreContentVC") as! ContentVC
        
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentVC
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
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
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print(self.buttonTitles.count / 4)
        return self.indexes!
    }
}
