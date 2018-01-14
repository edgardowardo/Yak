//
//  Board.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 10/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import Foundation

@objc(Board)
class Board: NSObject {
    
    let width = 4
    
    var height: Int {
        return tiles.count / width
    }
    
    var tiles: [Tile] = [
        .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
        .vertical(instance: 2, segment: .top), .square(instance: 1), .square(instance: 2), .vertical(instance: 3, segment: .top),
        .vertical(instance: 2, segment: .bottom), .square(instance: 3), .square(instance: 4), .vertical(instance: 3, segment: .bottom),
        .vertical(instance: 4, segment: .top), .block(row: .top, col: .lead), .block(row: .top, col: .trail), .vertical(instance: 5, segment: .top),
        .vertical(instance: 4, segment: .bottom), .block(row: .bottom, col: .lead), .block(row: .bottom, col: .trail), .vertical(instance: 5, segment: .bottom)
    ]
    
    let targets = [1, 2, 5, 6]
    
    override var description: String {
        var desc = ""
        let countNewLine = width - 1
        for i in 0 ..< self.tiles.count {
            desc += "\(tiles[i].description)\( (i % width) == countNewLine ? "\n" : ".")"
        }
        return desc
    }

    var isWin: Bool {
        return tiles[targets[0]] == .block(row: .top, col: .lead)
            && tiles[targets[1]] == .block(row: .top, col: .trail)
            && tiles[targets[2]] == .block(row: .bottom, col: .lead)
            && tiles[targets[3]] == .block(row: .bottom, col: .trail)
    }

}
