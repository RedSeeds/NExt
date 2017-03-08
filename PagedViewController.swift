//
//  PagedViewController.swift
//  NExt
//
//  Created by Douglas Sexton on 2/19/17.
//  Copyright © 2017 Douglas Sexton. All rights reserved.
//

import Foundation
import UIKit


class PagedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var pages = [CategoryPageViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        
        
        let page1 = createCategoryPage()
        let page2 = createCategoryPage()
        let page3 = createCategoryPage()
        
        pages = [page1,page2,page3]
        
        let views = ["view": view, "page1": page1.view, "page2": page2.view, "page3": page3.view]
        
        let verticalContraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: .alignAllCenterY, metrics: nil, views: views)
        
        
        NSLayoutConstraint.activate(verticalContraints)
        
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)]|", options: [.alignAllTop, .alignAllBottom] , metrics: nil, views: views)
        
        
        
        
        
        NSLayoutConstraint.activate(horizontalConstraints)
        
    }
    
    fileprivate func createCategoryPage() -> CategoryPageViewController {
        let categoryPage = storyboard!.instantiateViewController(withIdentifier: "CategoryPageViewController") as! CategoryPageViewController
        
        categoryPage.view.translatesAutoresizingMaskIntoConstraints = false
        
        //categoryPage.backgroundImage = UIImage(named: backgroundImageName)
       // categoryPage.iconImage = UIImage(named: iconImageName)
       // categoryPage.text = text
        
        scrollView.addSubview(categoryPage.view)
        
        addChildViewController(categoryPage)
        categoryPage.didMove(toParentViewController: self)
        
        return categoryPage
    }
}

extension PagedViewController: UIScrollViewDelegate {
    
    
}
