//
//  Tile.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 10/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

/*
   Board          Indexes
   _______          ___________
 0| . .←.→|        |00.01.02.03|
 1|↑.°.°.↑|        |04.05.06.07|
 2|↓.°.°.↓|        |08.09.10.11|
 3|↑.O.O.↑|        |12.13.14.15|
 4|↓.O.O.↓|        |16.17.18.19|
   _______          ___________
   0.1.2.3
 
 OO
 OO The block is composed of top leading, top trailing, bottom leading and bottom trailing tile.
 
 ° Square is the smallest unit of tile. There are four squares in the classic game. Instance orders are 1, 2, 3, 4 left to right, top down.
 
 ← → There is a single horizontal block in the classic game identified by it's instance with their leading and trailing segments. Instance order is 1.
 
 ↑
 ↓ There are four vertical blocks identified by their instance with their top and bottom segments in the classic game. Instance orders are 2, 3, 4 & 5.
 
 */

import Foundation

enum Tile {
    case none
    case square(instance: Int)
    case horizontal(instance: Int, segment: Segment)
    case vertical(instance: Int, segment: Segment)
    case block(row: Segment, col: Segment)
}

extension Tile {
    enum Movement {
        case up
        case down
        case left
        case right
    }
}

extension Tile.Movement {
    var sign: Int {
        switch self {
        case .up, .left: return -1
        case .down, .right: return 1
        }
    }
}

extension Tile {
    enum Segment {
        case top
        case bottom
        case lead
        case trail
    }
}

extension Tile.Segment {
    var opposite: Tile.Segment {
        switch self {
        case .top: return .bottom
        case .bottom: return .top
        case .lead: return .trail
        case .trail: return .lead
        }
    }
}

// Equatable

extension Tile: Equatable {}

func ==(lhs: Tile, rhs: Tile) -> Bool {
    switch (lhs, rhs) {
    case (.none, .none): return true
    case (let .block(rowL, colL), let .block(rowR, colR)): return rowL == rowR && colL == colR
    case (let .square(instanceL), let .square(instanceR)): return instanceL == instanceR
    case (let .horizontal(instanceL, segmentL), let .horizontal(instance: instanceR, segmentR)): return instanceL == instanceR && segmentL == segmentR
    case (let .vertical(instanceL, segmentL), let .vertical(instance: instanceR, segmentR)): return instanceL == instanceR && segmentL == segmentR
    default: return false
    }
}

// Description

extension Tile: CustomStringConvertible {
    var description: String {
        switch self {
        case .none: return " "
        case .block(_, _): return "O"
        case .square(_) : return "°"
        case .vertical(_, .top): return "↑"
        case .vertical(_, .bottom): return "↓"
        case .horizontal(_, .lead): return "←"
        case .horizontal(_, .trail): return "→"
        default: return "?"
        }
    }
}
