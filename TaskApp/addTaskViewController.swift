//
//  addTaskViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 05/10/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit

class addTaskViewController: UIViewController {

    @IBAction func closeMe(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveTask(_ sender: AnyObject) {
        
        
        
    }
    
    func getCurrentUser() -> String {
        return "adf"
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
