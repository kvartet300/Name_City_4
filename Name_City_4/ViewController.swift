//
//  ViewController.swift
//  Name_City_4
//
//  Created by MacAir300 on 22.04.2019.
//  Copyright © 2019 MacAir300. All rights reserved.
//

import UIKit

class ViewController:   UIViewController,
                        UITableViewDelegate,
                        UITableViewDataSource {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var viewNew:             UIView!
    @IBOutlet weak var userTableView:       UITableView!
    @IBOutlet weak var firstNameTextField:  UITextField!
    @IBOutlet weak var lastNameTextField:   UITextField!
    @IBOutlet weak var townTextField:       UITextField!
    @IBOutlet weak var buttonCancel:        UIButton!
    @IBOutlet weak var buttonDone:          UIButton!
    @IBOutlet weak var addButton:           UIButton!
    
    //MARK: - userDataArray
    var userDataArray : [BookUser?] = []
    
    
    //MARK: - vievDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.tableFooterView = UIView()
        userTableView.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag    // Hide keyboard
    }

    //MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataArray.count
    }
    
    //MARK: - cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        cell.firstNameLabel.text = self.userDataArray[indexPath.row]?.firstName
        cell.lastNameLabel.text = self.userDataArray[indexPath.row]?.lastName
        cell.townLabel.text = self.userDataArray[indexPath.row]?.town
        return cell
    }
    

    //MARK: - IBAction
    @IBAction func addButton(_ sender: UIButton) {
        viewNew.isHidden = false
    }
    
    @IBAction func buttonActCancel(_ sender: UIButton) {
        viewNew.isHidden = true
    }
    
    @IBAction func buttonActDone(_ sender: UIButton) {
        let userDataNew : BookUser? = BookUser(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, town: townTextField.text!)
        self.userDataArray.append(userDataNew)
        viewNew.isHidden = true
        userTableView.reloadData()
    }
    
    //MARK: - deleteRows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userDataArray.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            
        }
    }
}


