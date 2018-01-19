//
//  Board+Generator.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 16/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import Foundation

protocol TileDropProviding {
    func drop(tile: Tile, to column: Int) -> Bool
}
