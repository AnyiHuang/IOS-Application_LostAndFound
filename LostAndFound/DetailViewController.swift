//
//  DetailViewController.swift
//  LostAndFound
//
//  Created by 黄安怡 on 3/27/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController,UITextFieldDelegate{
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    var item:Item!{
        didSet{
            navigationItem.title = item.name
        }
    }
    @IBOutlet var nameField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override  func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        locationField.text = item.location
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //Clear first responder
        view.endEditing(true)
        //"Save" changes to item
        item.name = nameField.text ?? ""
        item.location = locationField.text ?? ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
