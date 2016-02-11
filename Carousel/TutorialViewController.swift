//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Alex Miles on 2/9/16.
//  Copyright © 2016 Dropbox. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonParentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialScrollView.delegate = self
        tutorialScrollView?.contentSize = CGSize(width: 1280, height: 568)
        buttonParentView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on scroll event
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        pageControl.hidden = false
        
        if page == 3 {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.buttonParentView.alpha = 1
                self.pageControl.hidden = true
            }
        } else {
            UIView.animateWithDuration(0.3) { () -> Void in
                self.buttonParentView.alpha = 0
                self.pageControl.hidden = false
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
