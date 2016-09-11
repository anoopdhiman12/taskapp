//
//  ViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 11/09/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //local variable
    var segmentFlag: Bool = false
    
    //Outlet
    @IBOutlet weak var btnSegment: UISegmentedControl!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    //Action
    
    @IBAction func segmentAction(sender: AnyObject) {
        
        if(segmentFlag){
            btnLogin.setTitle("Login", forState: btnLogin.state)
            segmentFlag = false
        }
        else{
            btnLogin.setTitle("Signup", forState: btnLogin.state)
            segmentFlag = true
        }
    }
    
    @IBAction func loginAction(sender: AnyObject) {
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            
        //view.backgroundColor:UIColor(patternImage: UIImage[imageNamed:"@wallpaper.png"])
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}