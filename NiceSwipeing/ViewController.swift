//
//  ViewController.swift
//  NiceSwipeing
//
//  Created by Mohamed Abd el Aty on 3/25/20.
//  Copyright © 2020 Aty. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    var image:[String] = ["diamond","Pic1","Pic2"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    @IBOutlet var pageControl: UIScrollView!
    @IBOutlet var scrollView: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          pageControl.delegate = self
        
        
        scrollView.numberOfPages = image.count
        
        for index in 0..<image.count {
            frame.origin.x = pageControl.frame.size.width * CGFloat(index)
            frame.size = pageControl.frame.size
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: image[index])
            self.pageControl.addSubview(imgView)
        }
        
        pageControl.contentSize = CGSize(width: (pageControl.frame.size.width * CGFloat(image.count)) ,height: pageControl.frame.size.height)
    
    }

    //ScrollView Method
    //================
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = pageControl.contentOffset.x / pageControl.frame.size.width
        self.scrollView.currentPage = Int (pageNumber)
        
    }
    
}

