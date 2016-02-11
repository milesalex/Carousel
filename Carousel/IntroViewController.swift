//
//  IntroViewController.swift
//  Carousel
//
//  Created by Alex Miles on 2/8/16.
//  Copyright © 2016 Dropbox. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: 320, height: 1136)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {

        let bottom: CGFloat = 568 // final position
        let offset = scrollView.contentOffset.y // scroll potition
        let percent = offset / bottom // Scroll view percentage from 0 to 1
        
        if percent >= 1 {
            tile1.transform = CGAffineTransformIdentity
            tile2.transform = CGAffineTransformIdentity
            tile3.transform = CGAffineTransformIdentity
            tile4.transform = CGAffineTransformIdentity
            tile5.transform = CGAffineTransformIdentity
            tile6.transform = CGAffineTransformIdentity
            return
        }
        
        var transform = CGAffineTransformMakeScale(1.5 - percent / 2, 1.5 - percent/2)
        transform = CGAffineTransformRotate(transform, CGFloat((20 - (20 * Double(percent))) * M_PI / 180))
        transform = CGAffineTransformTranslate(transform, -90 + (90 * percent), -200 + (200 * percent))
        
        var transform2 = CGAffineTransformMakeScale(2 - percent, 2 - percent)
        transform2 = CGAffineTransformRotate(transform2, CGFloat((-20 - (-20 * Double(percent))) * M_PI / 180))
        transform2 = CGAffineTransformTranslate(transform2, 70 + (-70 * percent), -150 + (150 * percent))
        
        var transform3 = CGAffineTransformMakeScale(2 - percent, 2 - percent)
        transform3 = CGAffineTransformRotate(transform3, CGFloat((15 - (15 * Double(percent))) * M_PI / 180))
        transform3 = CGAffineTransformTranslate(transform3, -25 + (25 * percent), -140 + (140 * percent))
        
        var transform4 = CGAffineTransformMakeScale(1.5 - percent / 2, 1.5 - percent / 2)
        transform4 = CGAffineTransformRotate(transform4, CGFloat((-15 - (-15 * Double(percent))) * M_PI / 180))
        transform4 = CGAffineTransformTranslate(transform4, 45 + (-45 * percent), -240 + (240 * percent))
        
        var transform5 = CGAffineTransformMakeScale(1.5 - percent / 2, 1.5 - percent / 2)
        transform5 = CGAffineTransformRotate(transform5, CGFloat((15 - (15 * Double(percent))) * M_PI / 180))
        transform5 = CGAffineTransformTranslate(transform5, -95 + (95 * percent), -240 + (240 * percent))
        
        var transform6 = CGAffineTransformMakeScale(1.5 - percent / 2, 1.5 - percent / 2)
        transform6 = CGAffineTransformRotate(transform6, CGFloat((-15 - (-15 * Double(percent))) * M_PI / 180))
        transform6 = CGAffineTransformTranslate(transform6, 35 + (-35 * percent), -250 + (250 * percent))
        
        tile1.transform = transform
        tile2.transform = transform2
        tile3.transform = transform3
        tile4.transform = transform4
        tile5.transform = transform5
        tile6.transform = transform6
    }
    
}
