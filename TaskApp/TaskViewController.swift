//
//  TaskViewController.swift
//  TaskApp
//
//  Created by Anoop Dhiman on 20/09/16.
//  Copyright © 2016 Anoop Dhiman. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


//struct task{
//    let date: String!
//    let status: String!
//    let task: String!
//}


class TaskViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    //var chk = [String]()
    
//    
//    var getdata:[AnyObject ] = []
//    var databaseref: FIRDatabaseReference!
//    
    
    var users = [user]()
   
    @IBOutlet weak var taskTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       fetUser()
    }
    func fetUser(){
        let uid = FIRAuth.auth()?.currentUser?.uid
        FIRDatabase.database().reference().child("Task").child(uid!).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject]{
            //if let dictionary = FIRDataSnapshot.value as? [String: AnyObject]{
                print(snapshot)
                let user1 = user()
                user1.setValuesForKeys(dictionary)
                print(user1)
                self.users.append(user1)
                DispatchQueue.main.async{
                    self.taskTable.reloadData()
                }
                
            }
            
            }, withCancel: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: <#T##IndexPath#>) as
        
        let cell = taskTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let user = users[indexPath.row]
        print(user)
        cell.textLabel?.text = user.task
        
        return cell
    }
    

    @IBAction func logoutMe(_ sender: AnyObject) {
     try! FIRAuth.auth()!.signOut()
        if self.storyboard != nil {                    
            let next1 = storyboard?.instantiateViewController(withIdentifier: "loginUi") as!  ViewController
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
