//
//  ItemsViewController.swift
//  LostAndFound
//
//  Created by 黄安怡 on 3/24/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit
class ItemsViewController: UITableViewController{
    
    var itemStore:ItemStore!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController
                    = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    @IBAction func addNewItem(_ sender:UIBarButtonItem){
        //Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //Figure out where that item is in the array
        if let index = itemStore.allItems.index(of:newItem){
            let indexPath = IndexPath(row:index,section: 0)
            
            //Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemStore.allItems.count
    }
    override func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath)->UITableViewCell{
        
        //Set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableView
        let item = itemStore.allItems[indexPath.row]
        
        if item.name == ""{
            print("test")
            self.itemStore.removeItem(item)
            print("yes")
            tableView.reloadData()
            //self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath) as! ItemCell

        cell.nameLabel.text = item.name
        cell.locationLabel.text = item.location
        return cell
        }
    override func tableView(_ View:UITableView,commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath){
//        print("run")
//        let item = itemStore.allItems[indexPath.row]
//        if item.name == ""{
//            print("test")
//            self.itemStore.removeItem(item)
//            print("yes")
//            tableView.reloadData()
//        }
        
        //If the table view is asking to commit a delete command...
        if editingStyle == .delete{
            let item = itemStore.allItems[indexPath.row]

            let title = "Delete \(item.name)?"
                    let message = "Are you sure you want to remove this item?"
                    
                    let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    ac.addAction(cancelAction)
                    
                    let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action)->Void in
                        //Remove the item from the store
                        self.itemStore.removeItem(item)
                        //also remove that row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            //Present the alert controller
            present(ac,animated: true,completion: nil)
        }
    }
    override func tableView(_ tableView:UITableView,moveRowAt sourceIndexPath:IndexPath, to destinationIndexPath:IndexPath){
        
        //Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
