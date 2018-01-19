//
//  GamePlay.swift
//  Yak
//
//  Created by Agno, Edgardo (Developer) on 15/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import GameplayKit

@objc(Move)
class Move: NSObject, GKGameModelUpdate {

    var value: Int = 0
    var tile: Tile
    var direction: Tile.Movement
    
    init(tile: Tile, direction: Tile.Movement) {
        self.tile = tile
        self.direction = direction
        super.init()
    }
}

extension Move {
    
    override var description: String {
        return "\(tile.detailedDescription) \(direction)"
    }
}

extension Player: GKGameModelPlayer {
    
    var playerId: Int { return self.id }
}

extension Board {
    
    func allowedMoves(from emptyIndex: Int) -> [Move] {
        return Tile.Movement.all.flatMap {
            let adjacent = emptyIndex + offset(moving: $0)
            guard isIndexBound(adjacent, by: $0, from: emptyIndex)
                else { return nil }
            let tile = tiles[adjacent]
            guard tile != .none, canMove(tile: tile, moving: $0.opposite)
                else { return nil }
            return Move(tile: tile, direction: $0.opposite)
        }
    }
}

extension Board: GKGameModel {
    
    //MARK: - Keeping Track of Players
    
    var players: [GKGameModelPlayer]? { return Player.allPlayers }

    var activePlayer: GKGameModelPlayer? { return currentPlayer }
    
    //MARK: - Evaluating a Game Model
    
    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        guard !isWin
            else { return [] }
        return tiles.enumerated()
            .filter{ (index, element) in element == .none }
            .flatMap{ (index, _) in allowedMoves(from: index) }
    }
    
    func isLoss(for player: GKGameModelPlayer) -> Bool {
        return !isWin
    }
    
    func isWin(for player: GKGameModelPlayer) -> Bool {
        let isWinner = isWin
        print("isWin=\(isWinner)")

        return isWinner
    }
    
    func score(for player: GKGameModelPlayer) -> Int {
        guard let index = tiles.index(of: .block(row: .top, col: .lead)),
            let target = targets.first else { return Int.min }
        let diff = index - target
        let (quotient, _) = diff.quotientAndRemainder(dividingBy: width)
        let score = (width - quotient) * 10
        print("scores \(score)...")
        return score
    }
    
    //MARK: - Modifying a Game Model
    
    func copy(with zone: NSZone? = nil) -> Any {
        print("copy ...")
        let copy = Board()
        copy.setGameModel(self)
        return copy
    }
    
    func apply(_ gameModelUpdate: GKGameModelUpdate) {
        guard let movement = gameModelUpdate as? Move
            else { return }
        move(tile: movement.tile, moving: movement.direction)
        
        // FIXME: Clean me!
        #if DEBUG
            print(movement)
            print("----------------\(appliedCount)\(isWin ? "***********WIN************" : "")")
            appliedCount = appliedCount + 1
            print(description)
        #endif
    }
    
    func unapplyGameModelUpdate(_ gameModelUpdate: GKGameModelUpdate) {
        guard let movement = gameModelUpdate as? Move
            else { return }
        move(tile: movement.tile, moving: movement.direction.opposite)
    }

    func setGameModel(_ gameModel: GKGameModel) {
        print("setGameModel ...")

        guard let model = gameModel as? Board
            else { return }
        self.updateFromBoard(model)
        self.currentPlayer = model.currentPlayer
        appliedCount = 0
    }
    
}
