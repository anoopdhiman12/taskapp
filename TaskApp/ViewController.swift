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
    @IBAction func segmentAction(_ sender: AnyObject) {
        if(segmentFlag){
            btnLogin.setTitle("Login", for: btnLogin.state)
            segmentFlag = false            
        }
        else{
            btnLogin.setTitle("Signup", for: btnLogin.state)
            segmentFlag = true
            //txtEmail.isFocused
        }
    }    
    //Signup/ Login Acton
    @IBAction func loginAction(_ sender: AnyObject) {
        
        let currentTitle = btnLogin.currentTitle
        if(currentTitle == "Signup"){
            //do signup
            if(checkValidEmail(txtEmail.text!) && (txtPwd.text != "")){
                //do firebase signup
                FIRAuth.auth()?.createUser(withEmail: (txtEmail.text)!, password: (txtPwd.text)!, completion: { (user, error) in
                    if let cUser = FIRAuth.auth()?.currentUser{
                        let uid = cUser.uid
                        let uDefaults = UserDefaults.standard
                        uDefaults.set(uid, forKey: "uid")
                        uDefaults.synchronize()
                        self.showAlert("Success", message: "Registered Successfully", closetitle: "Click to Login")
                        self.txtEmail.text = ""
                        self.txtPwd.text = ""
                        self.btnSegment.selectedSegmentIndex = 0
                        self.btnLogin.setTitle("Login", for: self.btnLogin.state)
                    }
                    //print(user)
                })
            }
            else{
                showAlert("Alert", message: "Invalid Email", closetitle: "Try again")
            }
        }
        else if(currentTitle == "Login"){
            
            
            guard let email = txtEmail.text, let pwd = txtPwd.text else {
                showAlert("alert", message: "Enter valid details", closetitle: "Try again")
                return
            }
            if(!checkValidEmail(email)){
                showAlert("alert", message: "Enter valid details", closetitle: "Try again")
                return
            }
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { ( user,error) in
                
                let uid = user?.uid
                print(uid)
                
                if let userid = uid{
                    UserDefaults.standard.setValue(userid, forKey: "uid")
                    //let next = self.storyboard?.instantiateViewController(withIdentifier: "taskUI") as! ViewController
                    let next1 = self.storyboard?.instantiateViewController(withIdentifier: "taskUI") as! TaskViewController
                    //self.present(next1, animated: true, completion: nil)
                    //self.presentingViewController(next1,animated: true, completion: nil)
                    //self.present(next1,animated: true, completion: nil)
                    
                    self.present(next1,animated:true, completion: nil)
                    
                    //self.showAlert("tt", message: "msg", closetitle: "ctitle")
                    
                }
            })
            
//            if let cUser = FIRAuth.auth()?.currentUser{
//                let uid = cUser.uid
//                let uDefaults = UserDefaults.standard
//                uDefaults.set(uid, forKey: "uid")
//                uDefaults.synchronize()
//                self.showAlert("Alert", message: "Login Succeed", closetitle: "succeed")
//                let next1 = self.storyboard?.instantiateViewController(withIdentifier: "taskUI") as! TaskViewController
//                self.present(next1, animated: true, completion: nil)
//                
//            }
//                
//            else{
//                self.txtEmail.text = ""
//                self.txtPwd.text = ""
//                self.showAlert("Alert", message: "Invalid Cridentials", closetitle: "Try again")
//   
//            }
            //do login
        }
        else{
            showAlert("Alert !!!", message: "Somthing went wrong", closetitle: "Try again leter")
        }
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 5
        //FIRApp.configure()
           // try! FIRAuth.auth()?.signOut()
            
        //self.view.backgroundColor = UIColor(patternImage: <#T##UIImage#>(named:"wallpaper.jpg"))
          
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpg")!)
            
            
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check valid email
    func checkValidEmail(_ email:String) -> Bool {
        return email.range(of: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$", options: .regularExpression) != nil
    }
    
    //Show Alert Message
    func showAlert (_ title:String,message:String, closetitle:String)  {
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.actionSheet)
        alertController.addAction(UIAlertAction(title: closetitle, style: UIAlertActionStyle.default,handler: nil))   
        self.present(alertController, animated: true, completion: nil)
    }

}
