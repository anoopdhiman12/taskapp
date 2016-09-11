//
//  ViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 11/09/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    //local variable
    var segmentFlag: Bool = false
    
    //Outlet
    @IBOutlet weak var btnSegment: UISegmentedControl!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    
    //Segment Control Action
    @IBAction func segmentAction(sender: AnyObject) {
        if(segmentFlag){
            btnLogin.setTitle("Login", forState: btnLogin.state)
            segmentFlag = false            
        }
        else{
            btnLogin.setTitle("Signup", forState: btnLogin.state)
            segmentFlag = true
            txtEmail.focused
        }
    }    
    //Signup/ Login Acton
    @IBAction func loginAction(sender: AnyObject) {
        let currentTitle = btnLogin.currentTitle
        if(currentTitle == "Signup"){
            //do signup
            if(checkValidEmail(txtEmail.text!) && (txtPwd.text != "")){
                //do firebase signup
                
                FIRAuth.auth()?.createUserWithEmail((txtEmail.text)!, password: (txtPwd.text)!, completion: { (let user, let error) in
                    if let cUser = FIRAuth.auth()?.currentUser{
                        let uid = cUser.uid
                        let uDefaults = NSUserDefaults.standardUserDefaults()
                        uDefaults.setObject(uid, forKey: "uid")
                        uDefaults.synchronize()
                        self.showAlert("Success", message: "Registered Successfully", closetitle: "Click to Login")
                        self.txtEmail.text = ""
                        self.txtPwd.text = ""
                        self.btnSegment.selectedSegmentIndex = 0
                        self.btnLogin.setTitle("Login", forState: self.btnLogin.state)
                    }
                    //print(user)
                })
            }
            else{
                showAlert("Alert", message: "Invalid Email", closetitle: "Try again")
            }
        }
        else if(currentTitle == "Login"){
            //do login
        }
        else{
            showAlert("Alert !!!", message: "Somthing went wrong", closetitle: "Try again leter")
        }
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 5
        FIRApp.configure()
            
        //self.view.backgroundColor = UIColor(patternImage: <#T##UIImage#>(named:"wallpaper.jpg"))
          
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpg")!)
            
            
       
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check valid email
    func checkValidEmail(email:String) -> Bool {
        return email.rangeOfString("^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$", options: .RegularExpressionSearch) != nil
    }
    
    //Show Alert Message
    func showAlert (title:String,message:String, closetitle:String)  {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: closetitle, style: UIAlertActionStyle.Default,handler: nil))   
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}