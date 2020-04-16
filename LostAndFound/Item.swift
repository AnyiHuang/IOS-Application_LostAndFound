//
//  Item.swift
//  LostAndFound
//
//  Created by Anyi Huang on 3/20/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding{
    var name: String
    var location: String
    let dateCreated: Date
    
    init(name:String,location:String) {
        self.name = name
        self.location = location
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let nameArray = ["key", "Basketball", "backpack"]
            let locationArray = ["Gym", "Voety", "Water Man"]

            var idx = arc4random_uniform(UInt32(nameArray.count))
            let randomName = nameArray[Int(idx)]

            idx = arc4random_uniform(UInt32(locationArray.count))
            let randomLocation = locationArray[Int(idx)]
            
            self.init(name: "click and set your item's name",
                location: "location")
        } else {
            self.init(name: "", location: "")
        }
    }
    func encode(with aCoder:NSCoder){
        aCoder.encode(name,forKey: "name")
        aCoder.encode(location,forKey: "location")
        aCoder.encode(dateCreated,forKey: "dateCreated")
    }
    required init(coder aDeCoder: NSCoder) {
        name = aDeCoder.decodeObject(forKey: "name") as! String
        dateCreated = aDeCoder.decodeObject(forKey: "dateCreated") as! Date
        location = aDeCoder.decodeObject(forKey: "location") as! String
        super.init()
    }
}

