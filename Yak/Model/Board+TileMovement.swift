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
        case (.square(_), .up):
            let indexTop = index - width
            guard indexTop > -1
                else { return false }
            return jar[indexTop] == .none
        case (.square(_), .down):
            let indexBottom = index + width
            guard indexBottom < jar.count
                else { return false }
            return jar[indexBottom] == .none
        case (.square(_), .left):
            guard index % width > 0
                else { return false }
            return jar[index - 1] == .none
        case (.square(_), .right):
            guard index % width < 3
                else { return false }
            return jar[index + 1] == .none
            
        // BOURBON HORIZONTAL
        case (.horizontal(1, .lead), .up):
            let indexTopLeft = index - width
            let indexTopRight = indexTopLeft + 1
            guard indexTopLeft > -1 && indexTopRight > -1
                else { return false }
            return jar[indexTopLeft] == .none && jar[indexTopRight] == .none
        case (.horizontal(1, .trail), .up):
            let indexTopRight = index - width
            let indexTopLeft = indexTopRight - 1
            guard indexTopLeft > -1 && indexTopRight > -1
                else { return false }
            return jar[indexTopLeft] == .none && jar[indexTopRight] == .none
            
        case (.horizontal(1, .lead), .down):
            let indexBottomLeft = index + width
            let indexBottomRight = indexBottomLeft + 1
            guard indexBottomLeft < jar.count && indexBottomRight < jar.count
                else { return false }
            return jar[indexBottomLeft] == .none && jar[indexBottomRight] == .none
        case (.horizontal(1, .trail), .down):
            let indexBottomRight = index + width
            let indexBottomLeft = indexBottomRight - 1
            guard indexBottomLeft < jar.count && indexBottomRight < jar.count
                else { return false }
            return jar[indexBottomLeft] == .none && jar[indexBottomRight] == .none
            
        case (.horizontal(1, .lead), .left):
            guard index % width > 0
                else { return false }
            return jar[index - 1] == .none
        case (.horizontal(1, .trail), .left):
            guard index % width > 1
                else { return false }
            return jar[index - 2] == .none
        case (.horizontal(1, .lead), .right):
            guard index % width < 2
                else { return false }
            return jar[index + 2] == .none
        case (.horizontal(1, .trail), .right):
            guard index % width < 3
                else { return false }
            return jar[index + 1] == .none
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
        case (.square(_), .up):
            jar[index - width] = tile
        case (.square(_), .down):
            jar[index + width] = tile
        case (.square(_), .left):
            jar[index - 1] = tile
        case (.square(_), .right):
            jar[index + 1] = tile
            
            // BOURBON HORIZONTAL
            
        case (.horizontal(1, .lead), .up):
            jar[index - width] = jar[index]
            jar[index - width + 1] = jar[index + 1]
            jar[index] = .none
            jar[index + 1] = .none
        case (.horizontal(1, .trail), .up):
            jar[index - width] = jar[index]
            jar[index - width - 1] = jar[index - 1]
            jar[index] = .none
            jar[index - 1] = .none
        case (.horizontal(1, .lead), .down):
            jar[index + width] = jar[index]
            jar[index + width + 1] = jar[index + 1]
            jar[index] = .none
            jar[index + 1] = .none
        case (.horizontal(1, .trail), .down):
            jar[index + width] = jar[index]
            jar[index + width - 1] = jar[index - 1]
            jar[index] = .none
            jar[index - 1] = .none
            
        case (.horizontal(1, .lead), .left):
            jar[index - 1] = tile
            jar[index] = jar[index + 1]
            jar[index + 1] = .none
        case (.horizontal(1, .trail), .left):
            jar[index - 2] = jar[index - 1]
            jar[index - 1] = jar[index]
            jar[index] = .none
        case (.horizontal(1, .lead), .right):
            jar[index + 2] = jar[index + 1]
            jar[index + 1] = jar[index]
            jar[index] = .none
        case (.horizontal(1, .trail), .right):
            jar[index + 1 ] = jar[index]
            jar[index] = jar[index - 1]
            jar[index - 1] = .none
        default:
            return
        }
        
        if case .square(_) = tile {
            jar[index] = .none
        }
    }
}
