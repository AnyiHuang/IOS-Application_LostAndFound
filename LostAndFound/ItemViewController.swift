//
//  ItemViewController.swift
//  LostAndFound
//
//  Created by Anyi Huang on 3/20/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit
class ItemViewController: UITableViewController{
    
    var itemStore:ItemStore!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemStore.allItems.count
    }
//
    override func tableView(_ tableView:UITableView,cellForRowAt indexPath: IndexPath)->UITableViewCell{
        //Set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableView
    
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",for: indexPath)
        let item = itemStore.allItems[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        return cell
    }
//    override func sectionIndexTitles(for tableView:UITableView)->[String]?{
//        return itemStore.sectionIndexTitles
//    }
    
}
