//
//  LoginViewController.swift
//  Carousel
//
//  Created by Alex Miles on 2/8/16.
//  Copyright © 2016 Dropbox. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func backButtonAction(sender: AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    @IBAction func signInButtonAction(sender: AnyObject) {
        
        func showAlertWithTitle(title: String, andMessage message: String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel){ (action) in }
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true){}
        }
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            showAlertWithTitle("Email and Password Required", andMessage: "Please enter your email address and password")
        } else {
            activityIndicator.startAnimating()
            delay(2) {
                if self.emailField.text == "Alex" && self.passwordField.text == "secret" {
                    self.activityIndicator.stopAnimating()
                    self.performSegueWithIdentifier("tutorialSegue", sender: self)
                } else {
                    showAlertWithTitle("Invalid Email or Password", andMessage: "Please check your email and password to make sure they are correct")
                }
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        self.scrollView.contentSize = scrollView.frame.size
        self.scrollView.contentInset.bottom = 100
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!){
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!){
        buttonParentView.frame.origin.y = buttonInitialY
        scrollView.contentOffset.y = scrollView.contentInset.top
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
