//
//  TaskViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 20/09/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit
import FirebaseAuth

class TaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.value(forKey: "uid") == nil {
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutMe(_ sender: AnyObject) {
     try! FIRAuth.auth()!.signOut()
        if let storyyboard = self.storyboard {
        
            
            let next1 = storyyboard.instantiateViewController(withIdentifier: "loginUI") as! ViewController
            //self.present(next1, animated: true, completion: nil)
            //self.presentingViewController(next1,animated: true, completion: nil)
            //self.present(next1,animated: true, completion: nil)
            
            self.present(next1,animated:true, completion: nil)
        
        }
        
        
        
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
