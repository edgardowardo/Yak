//
//  Board+TileMovement.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 10/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import Foundation

protocol TileMovementProviding {
    func canMove(tile: Tile, direction: Tile.Movement) -> Bool
    func move(tile: Tile, direction: Tile.Movement)
}

extension Board: TileMovementProviding {
    
    var height: Int {
        return jar.count / width
    }
    
    func isIndexBound(_ targetIndex: Int, by direction: Tile.Movement, from index: Int ) -> Bool {
        let modulus = index % width
        switch direction {
        case .up: return targetIndex >= 0
        case .down: return targetIndex < jar.count
        case .left: return targetIndex >= index - modulus
        case .right: return targetIndex < index + width - modulus
        }
    }
    
    func otherOffset(for tile: Tile) -> Int {
        switch tile {
        case .horizontal(_, segment: .lead):
            return 1
        case .horizontal(_, segment: .trail):
            return -1
        case .vertical(_, segment: .top):
            return width
        case .vertical(_, segment: .bottom):
            return -width
        default:
            assertionFailure("No other index")
            return 0
        }
    }
    
    func offset(for tile: Tile, moving direction: Tile.Movement) -> Int {
        switch (tile, direction) {
        case (.square(_), .up),
             (.square(_), .down),
             (.horizontal(_, _), .up),
             (.horizontal(_, _), .down):
            return direction.sign * width
        case (.square(_), .left),
             (.square(_), .right),
             (.horizontal(_, .lead), .left),
             (.horizontal(_, .trail), .right):
            return direction.sign
        case (.horizontal(_, .trail), .left),
             (.horizontal(_, .lead), .right):
            return direction.sign + direction.sign
        default: return 0
        }
    }
    
    func canMove(tile: Tile, direction: Tile.Movement) -> Bool {
        guard let index = jar.index(of: tile) else {
            assertionFailure("No tile inside the jar")
            return false
        }
        guard tile != .none else {
            assertionFailure("None cannot be displaced")
            return false
        }
        switch (tile, direction) {
            
        // SQUARE
        case (.square(_), _):
            let targetIndex = index + offset(for: tile, moving: direction)
            guard isIndexBound(targetIndex, by: direction, from: index)
                else { return false }
            return jar[targetIndex] == .none

        // HORIZONTAL
        case (.horizontal(_, _), .up),
             (.horizontal(_, _), .down):
            let targetIndex = index + offset(for: tile, moving: direction)
            let targetIndexRelated = targetIndex + otherOffset(for: tile)
            guard isIndexBound(targetIndex, by: direction, from: index) && isIndexBound(targetIndexRelated, by: direction, from: index)
                else { return false }
            return jar[targetIndex] == .none && jar[targetIndexRelated] == .none
        case (.horizontal(_, .lead), .left),
             (.horizontal(_, .trail), .right),
             (.horizontal(_, .lead), .right),
             (.horizontal(_, .trail), .left):
            let targetIndex = index + offset(for: tile, moving: direction)
            guard isIndexBound(targetIndex, by: direction, from: index)
                else { return false }
            return jar[targetIndex] == .none
            
        default: return false
        }
    }
    
    func move(tile: Tile, direction: Tile.Movement) {
        guard canMove(tile: tile, direction: direction)
            else { return }
        guard let index = jar.index(of: tile) else {
            assertionFailure("No tile inside the jar")
            return
        }
        
        switch (tile, direction) {
            
        // SQUARE
        case (.square(_), _):
            jar[index + offset(for: tile, moving: direction)] = tile
            jar[index] = .none
            
        // HORIZONTAL
        case (.horizontal(_, _), .up),
             (.horizontal(_, _), .down):
            let off = offset(for: tile, moving: direction)
            let otherOff = otherOffset(for: tile)
            jar[index + off] = jar[index]
            jar[index + off + otherOff] = jar[index + otherOff]
            jar[index] = .none
            jar[index + otherOff] = .none
        case (.horizontal(_, .lead), .left), // PULL
             (.horizontal(_, .trail), .right):
            let off = offset(for: tile, moving: direction)
            jar[index + off] = jar[index]
            jar[index] = jar[index - off]
            jar[index - off] = .none
        case (.horizontal(_, .trail), .left), // PUSH
             (.horizontal(_, .lead), .right):
            let off = offset(for: tile, moving: direction)
            let otherOff = otherOffset(for: tile)
            jar[index + off] = jar[index + otherOff]
            jar[index + otherOff] = jar[index]
            jar[index] = .none
            
        default:
            return
        }
        
    }
}
