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
    var date: String!
    var status: String!
    var task: String!
}


class TaskViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    //var chk = [String]()
    
//    
//    var getdata:[AnyObject ] = []
//    var databaseref: FIRDatabaseReference!
//  
    
    struct taskk {
        let date:String!
        let status:String!
        let task:String!
    }
    
    
    var users = [user]()
    let taskks = [taskk].self
    var ref: FIRDatabaseReference!
    var dict : [[String:String]] = []
    
   
    @IBOutlet weak var taskTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fethuser1()
    }
    
    func fethuser1(){
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        if let uuu = userID{
            
            print (uuu)
            
           ref = FIRDatabase.database().reference()
        
        //ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
        ref.child(uuu).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                //print((rest.value)!)
                self.dict.append((rest.value)! as! [String : String])
            }
            
            print(self.dict)
            
        self.taskTable.reloadData()
        
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        }
        
    }
    
    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("<><>Users")
        print(self.dict.count)
        return self.dict.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        //let uid = FIRAuth.auth()?.currentUser?.uid
        //let ref = FIRDatabase.database().reference().child(uid!)
        //ref.observesingle
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: <#T##IndexPath#>) as
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        //let user = users[indexPath.row]
        //print("tblview print")
        //print(user)
    
        cell.textLabel?.text = self.dict[indexPath.item]["task"]
        
        
        
        
        
        
    
        return cell
    }
    

//    func logoutMe(_ sender: AnyObject) {
//     try! FIRAuth.auth()!.signOut()
//        if self.storyboard != nil {
//            let next1 = storyboard?.instantiateViewController(withIdentifier: "loginUi") as!  ViewController
//            self.present(next1, animated: true, completion: nil)
//            self.presentingViewController(next1,animated: true, completion: nil)
//            self.present(next1,animated: true, completion: nil)
//            self.present(next1,animated:true, completion: nil)
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         //Dispose of any resources that can be recreated.
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
