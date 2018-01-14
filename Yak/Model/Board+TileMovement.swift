//
//  Board+TileMovement.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 10/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import Foundation

protocol TileMovementProviding {
    func canMove(tile: Tile, moving towards: Tile.Movement) -> Bool
    func canMove(segments: [Int], moving towards: Tile.Movement) -> Bool
    func move(tile: Tile, moving towards: Tile.Movement)
}

extension Board: TileMovementProviding {
    
    func isIndexBound(_ targetIndex: Int, by direction: Tile.Movement, from index: Int ) -> Bool {
        let modulus = index % width
        switch direction {
        case .up: return targetIndex >= 0
        case .down: return targetIndex < tiles.count
        case .left: return targetIndex >= index - modulus
        case .right: return targetIndex < index + width - modulus
        }
    }

    func segmentIndexes(for index: Int) -> [Int] {
        let tile = tiles[index]
        switch tile {
        case .square(_): return [index]
        case .horizontal(_, segment: .lead): return [index, index + 1]
        case .horizontal(_, segment: .trail): return [index - 1, index]
        case .vertical(_, segment: .top): return [index, index + width]
        case .vertical(_, segment: .bottom): return [index - width, index]
        case .block(row: .top, col: .lead): return [index, index + 1, index + width, index + width + 1]
        case .block(row: .top, col: .trail): return [index - 1, index, index + width - 1, index + width]
        case .block(row: .bottom, col: .lead): return [index - width, index - width + 1, index, index + 1]
        case .block(row: .bottom, col: .trail): return [index - width - 1, index - width, index - 1, index]
        default: return []
        }
    }
    
    func offset(moving towards: Tile.Movement) -> Int {
        switch towards {
        case .up, .down: return towards.sign * width
        case .left, .right: return towards.sign
        }
    }

    func displace(segments: [Int], moving towards: Tile.Movement) {
        guard let firstIndex = segments.first
            else { return }
        let tile = tiles[firstIndex]
        
        switch (tile, towards) {
        case (.square(_), _),
             (.horizontal(_, _), .right),
             (.vertical(_, _), .down):
            tiles[segments[0]] = .none
        case (.horizontal(_, _), .left),
             (.vertical(_, _), .up):
            tiles[segments[1]] = .none
        case (.horizontal(_, _), .up),
             (.horizontal(_, _), .down),
             (.vertical(_, _), .left),
             (.vertical(_, _), .right):
            segments.forEach{ tiles[$0]  = .none }
        case (.block(_, _), .up):
            segments[2...3].forEach{ tiles[$0]  = .none }
        case (.block(_, _), .down):
            segments[0...1].forEach{ tiles[$0]  = .none }
        case (.block(_, _), .left):
            [1, 3].map{ segments[$0] }.forEach{ tiles[$0] = .none }
        case (.block(_, _), .right):
            [0, 2].map{ segments[$0] }.forEach{ tiles[$0] = .none }
        default:
            return
        }
    }
    
    func copy(segments: [Int], moving towards: Tile.Movement) {
        guard let firstIndex = segments.first
            else { return }
        let tile = tiles[firstIndex]
        var sourceSegmentIndexes = [Int]()
        switch (tile, towards) {
        case (.square(_), _):
            sourceSegmentIndexes = [0]
        case (.horizontal(_, _), .left),
             (.vertical(_, _), .up),
             (.horizontal(_, _), .up),
             (.horizontal(_, _), .down),
             (.vertical(_, _), .left),
             (.vertical(_, _), .right):
            sourceSegmentIndexes = [0, 1]
        case (.horizontal(_, _), .right),
             (.vertical(_, _), .down):
            sourceSegmentIndexes = [1, 0]
        case (.block(_, _), .up),
             (.block(_, _), .left):
            sourceSegmentIndexes = [0, 1, 2, 3]
        case (.block(_, _), .down),
             (.block(_, _), .right):
            sourceSegmentIndexes = [3, 2, 1, 0]
        default: assertionFailure("Incorrect move")
        }
        sourceSegmentIndexes
            .map{ (segments[$0], segments[$0] + offset(moving: towards)) }
            .forEach { (old, new) in tiles[new] = tiles[old] }
    }
    
    func canMove(tile: Tile, moving towards: Tile.Movement) -> Bool {
        guard let index = tiles.index(of: tile) else {
            assertionFailure("No tile inside the board")
            return false
        }
        guard tile != .none else {
            assertionFailure("None cannot be displaced")
            return false
        }
        
        let segments = segmentIndexes(for: index)
        return canMove(segments: segments, moving: towards)
    }
    
    func canMove(segments: [Int], moving towards: Tile.Movement) -> Bool {
        guard let firstIndex = segments.first
            else { return false }
        let tile = tiles[firstIndex]
        var sourceSegmentIndexes = [Int]()
        
        switch (tile, towards) {
            
        case (.square(_), _),
             (.horizontal(_, _), .left),
             (.vertical(_, _), .up):
            sourceSegmentIndexes = [0]
        case (.horizontal(_, _), .right),
             (.vertical(_, _), .down):
            sourceSegmentIndexes = [1]
        case (.horizontal(_, _), .up),
             (.horizontal(_, _), .down),
             (.vertical(_, _), .left),
             (.vertical(_, _), .right),
             (.block(_, _), .up):
            sourceSegmentIndexes = [0, 1]
        case (.block(_, _), .down):
            sourceSegmentIndexes = [2, 3]
        case (.block(_, _), .left):
            sourceSegmentIndexes = [0, 2]
        case (.block(_, _), .right):
            sourceSegmentIndexes = [1, 3]
        default: return false
        }
        
        return sourceSegmentIndexes.map{
            let targetIndex = segments[$0] + offset(moving: towards)
            return isIndexBound(targetIndex, by: towards, from: segments[$0]) && tiles[targetIndex] == .none
            }.reduce(true){ (run, element) in run && element }
    }
    
    func move(tile: Tile, moving towards: Tile.Movement) {
        guard let index = tiles.index(of: tile) else {
            assertionFailure("No tile inside the board")
            return
        }
        let segments = segmentIndexes(for: index)
        guard canMove(segments: segments, moving: towards)
            else { return }
        copy(segments: segments, moving: towards)
        displace(segments: segments, moving: towards)
    }
}
