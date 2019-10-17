//
//  ViewController.swift
//  ShoppingListApp
//
//  Created by Angadjot singh on 16/10/19.
//  Copyright © 2019 Angadjot singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
    
    @IBOutlet weak var textfieldItem: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBOutlet weak var shoppinglistTableView: UITableView!
    
    
    var shoppingListArray = [String]()
    var quantity = 1.0
    
    var arrayCount = 0
    
    @IBAction func wssw(_ sender: UIStepper) {
        
        print("stepper working")
        print(sender.value)
        quantity = sender.value
        print("quantity is",quantity)
        self.shoppinglistTableView.reloadData()
    }
    
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

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        if let itemName = cell.viewWithTag(1) as? UILabel{
            itemName.text = shoppingListArray[indexPath.row]
        }
    
        if let quantityLabel = cell.viewWithTag(3) as? UILabel{
            
             quantityLabel.text = String(quantity)
            
        }
        
        
//        if let quantityLabel = cell.viewWithTag(3) as? UILabel{
//
//            if arrayCount == 1{
//                if indexPath.row == 0{
//                    quantityLabel.text = String(quantity)
//                }
//            }
//
//           else if arrayCount == 2{
//                if indexPath.row == 1{
//                    quantityLabel.text = String(quantity)
//                }
//            }
//        }
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath.row",indexPath.row)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let item = textfieldItem.text
        self.shoppingListArray.append(item!)
        print("array is",shoppingListArray)
        
        arrayCount = shoppingListArray.count
        print("count is",shoppingListArray.count)
        
        self.shoppinglistTableView.reloadData()
    }
    
    
    @IBAction func save(_ sender: UIButton) {
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        self.shoppingListArray.removeAll()
        self.quantity = 1.0
        self.shoppinglistTableView.reloadData()
    }
    
    
    
    
    
    

}

