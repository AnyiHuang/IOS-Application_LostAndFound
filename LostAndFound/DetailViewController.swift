//
//  DetailViewController.swift
//  LostAndFound
//
//  Created by 黄安怡 on 3/27/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    var itemStore:ItemStore!
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    var item:Item!{
        didSet{
            navigationItem.title = item.name
        }
    }

    override  func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        locationField.text = item.location
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    @IBAction func deleteDetail(_ sender: UIBarButtonItem) {
        //self.viewWillDisappear(true)
        print("pass")
        navigationItem.title = "None"
        nameField.text = ""
        locationField.text = ""
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Clear first responder
        view.endEditing(true)
        //"Save" changes to item
        item.name = nameField.text ?? ""
        item.location = locationField.text ?? ""
    }
    func textFieldShouldReturn(_ textField: UITextField, checkDelete:String) -> Bool {
        textField.resignFirstResponder()
        if checkDelete == "true"{
            
        }
        return true
    }
}
