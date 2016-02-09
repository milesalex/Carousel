//
//  ImageTimelineViewController.swift
//  Carousel
//
//  Created by Alex Miles on 2/9/16.
//  Copyright © 2016 Dropbox. All rights reserved.
//

import UIKit

class ImageTimelineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1564)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
