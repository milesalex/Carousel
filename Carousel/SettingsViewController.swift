//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Alex Miles on 2/9/16.
//  Copyright © 2016 Dropbox. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func closeButtonAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 695)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
