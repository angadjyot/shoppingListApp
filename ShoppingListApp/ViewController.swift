//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Angadjot singh on 16/10/19.
//  Copyright © 2019 Angadjot singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource { 

    
    
    @IBOutlet weak var textfieldItem: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    var shoppingListArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addButton.layer.cornerRadius = 10.0
        addButton.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 10.0
        saveButton.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 10.0
        cancelButton.layer.masksToBounds = true
        
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = "hello"
        return cell
        
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let item = textfieldItem.text
        self.shoppingListArray.append(item!)
        print("array is",shoppingListArray)
    }
    
    

}

