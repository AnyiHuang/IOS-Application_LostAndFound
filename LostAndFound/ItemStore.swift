//
//  ItemStore.swift
//  LostAndFound
//
//  Created by 黄安怡 on 3/20/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit
class ItemStore{
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    init(){
        do{
            let data = try Data(contentsOf: itemArchiveURL)
            if let archiveData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as?[Item]{
                allItems = archiveData
            }
        }catch{
            allItems = []
        }
    }
    @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        print (allItems)
        return newItem
    }
    
    func removeItem(_ item:Item){
        if let index = allItems.index(of:item){
            allItems.remove(at: index)
            //print (allItems)
        }
    }
    
    func moveItem(from fromIndex:Int, to toIndex:Int){
        if fromIndex == toIndex{
            return
        }
        
        //Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        //Remove item from array
        allItems.remove(at: fromIndex)
        
        //Insert item in array at new location
        allItems.insert(movedItem,at:toIndex)
    }
    func saveChanges()->Bool {
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: allItems, requiringSecureCoding: false)
            try data.write(to:itemArchiveURL)
            return true
        }catch{
            return false
        }
    }

}
