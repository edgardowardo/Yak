//
//  Player.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 15/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import Foundation

@objc (Player)
class Player: NSObject {

    let id: Int
    
    init(id: Int) {
        self.id = id
        super.init()
    }
    
    class func computer() -> Player {
        return allPlayers[0]
    }
    
    static var allPlayers: [Player] = [Player(id: 0)]
}
