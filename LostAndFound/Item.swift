//
//  Item.swift
//  LostAndFound
//
//  Created by Anyi Huang on 3/20/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit

class Item: NSObject{
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
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]

            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]

            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]

            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomLocation = "\(randomAdjective) \(randomNoun)"

            self.init(name: randomName,
                location: randomLocation)
        } else {
            self.init(name: "", location: "")
        }
    }
}

