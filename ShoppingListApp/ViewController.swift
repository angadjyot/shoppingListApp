//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Angadjot singh on 16/10/19.
//  Copyright © 2019 Angadjot singh. All rights reserved.
// File Name - ViewController.swift
// Author's Name - Angadjot Singh Modi
// Student ID - 301060981
// Date - 16/10/19.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
// declaring the reference variables
    @IBOutlet weak var textfieldItem: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var shoppinglistTableView: UITableView!
    
    // declaring the array
    var shoppingListArray = [String]()
    
    var quantity = 1.0
    var arrayCount = 0
    
    let defaults = UserDefaults.standard
    
//    action function for stepper
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        print("stepper working")
        print(sender.value)
        quantity = sender.value
        print("quantity is",quantity)
        self.shoppinglistTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        corner radius the buttons
        
        addButton.layer.cornerRadius = 10.0
        addButton.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 10.0
        saveButton.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 10.0
        cancelButton.layer.masksToBounds = true
        
    }

//    function for closing the keypad on return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    function for number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListArray.count
    }
    
 //    function for displaying the items list in table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if let itemName = cell.viewWithTag(1) as? UILabel{
            itemName.text = shoppingListArray[indexPath.row]
        }
    
        if let quantityLabel = cell.viewWithTag(3) as? UILabel{
            
             quantityLabel.text = String(quantity)
            
        }
    
        return cell
        
    }
    
    //    function for selecting the row in table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row",indexPath.row)
        
    }
    
    //    function for height of the row in table view
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
//    function for adding the items in the array and displaying into the table view
    @IBAction func addButtonAction(_ sender: UIButton) {
        let item = textfieldItem.text
        self.shoppingListArray.append(item!)
        print("array is",shoppingListArray)
        
        arrayCount = shoppingListArray.count
        print("count is",shoppingListArray.count)
        
        self.shoppinglistTableView.reloadData()
    }
    
//function for save button and saving the item list into userdefaults
    @IBAction func save(_ sender: UIButton) {
        defaults.set(shoppingListArray, forKey: "shoppingListArray")
    }
    
    
//    function for cancel button and clearing out everything
    @IBAction func cancel(_ sender: UIButton) {
        self.shoppingListArray.removeAll()
        self.quantity = 0
        self.shoppinglistTableView.reloadData()
    }
    
    
    
    
    
    

}

