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


struct task{
    let date: String!
    let status: String!
    let task: String!
}


class TaskViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var tasks = [task]()
    var getdata:[AnyObject] = []
    
    
    
    var databaseref: FIRDatabaseReference!
    var newItems:[String:AnyObject] = [:]
    var dictionary:[String:AnyObject] = [:]
    
    @IBOutlet weak var taskTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cUser = FIRAuth.auth()?.currentUser{
            let uid:String = cUser.uid
                databaseref = FIRDatabase.database().reference().child("Task").child(uid)
                databaseref.observe(.value, with: { (snapshot) in
                for item in snapshot.children {
                    //print((item as AnyObject).date!)
                    //let tt = (item as AnyObject).task
                    //print(tt)
                    //print(item)
                    self.getdata.append(item as AnyObject)
                    
                    //let task = (item as AnyObject).value(value(forKey: "task"))
                   // let tt =  snapshot.children.value(forKey: "task")
                    //print(tt)
                    //self.tasks.append(snapshot.key("task"))
                    //self.tasks.append(item as! task)
                }
                print("--")
                print(self.getdata)
                print(self.getdata.count)
                    
            })
    }
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return  3
        //return dictionary.count
        return self.getdata.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: <#T##IndexPath#>) as
        
        let cell = taskTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        //let itaraay = getdata[indexPath.item]
        cell.textLabel?.text = "one"
        //cell.textLabel?.text = itaraay.value(forKey: "task") as! String
        
        
        
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
