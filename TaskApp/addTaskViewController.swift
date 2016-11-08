//
//  addTaskViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 05/10/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class addTaskViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    

    @IBAction func closeMe(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var taskText: UITextField!
    @IBAction func saveTask(_ sender: AnyObject) {
        
        ref = FIRDatabase.database().reference()
        if let cUser = FIRAuth.auth()?.currentUser{
            let uid:String = cUser.uid
            let task:String = taskText.text!
            let date:String = "4/4/2016"
            let status:String = "0"
            
            
            ref.child(uid).childByAutoId().setValue(["task": task,"date": date,"status":status])
            //ref.child(uid).childByAutoId().dictionaryWithValues(forKeys: "task": task,"date": date,"status",,:status)
            //ref.child(uid).childByAutoId().setValue(["task": task,"date": date,"status":status])
            //ref.childByAutoId().setValue(["task": task,"date": date,"status":status,"user":uid])
            
            
            
            
            
        }
        
        else
        
        {
            
        }
        
    }
    
    func getCurrentUser() -> String {
        return "adf"
                
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
