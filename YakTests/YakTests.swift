//
//  YakTests.swift
//  YakTests
//
//  Created by Agno, Edgardo (Developer) on 10/01/2018.
//  Copyright © 2018 Agno, Edgardo (Developer). All rights reserved.
//

import XCTest
@testable import Yak

class YakTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func note(_ board: Board) {
        print("[\n\(board)]")
    }
    
    func test_square_can_move_up_then_down() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        board.move(tile: .square(instance: 1), direction: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        board.move(tile: .square(instance: 1), direction: .down)
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
    }
    
    func test_square_can_move_left_and_right() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        board.move(tile: .square(instance: 1), direction: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        board.move(tile: .square(instance: 1), direction: .left)
        
        note(board)
        XCTAssert(board.description == "°. .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right))
        
        board.move(tile: .square(instance: 1), direction: .right)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
    }
    
    func test_squares_can_move_around() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        board.move(tile: .square(instance: 1), direction: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), direction: .right) == false)
        
        let square2assertions = {
            XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 2), direction: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 2), direction: .down) == false)
            XCTAssert(board.canMove(tile: .square(instance: 2), direction: .left))
            XCTAssert(board.canMove(tile: .square(instance: 2), direction: .right) == false)
        }
        board.move(tile: .square(instance: 2), direction: .up)
        square2assertions()
        board.move(tile: .square(instance: 2), direction: .right)
        square2assertions()
        board.move(tile: .square(instance: 2), direction: .down)
        square2assertions()
        
        board.move(tile: .square(instance: 2), direction: .left)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 2), direction: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), direction: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), direction: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), direction: .right))
        
        board.move(tile: .square(instance: 4), direction: .up)
        
        let square4assertions = {
            self.note(board)
            XCTAssert(board.description == " .°.←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 4), direction: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 4), direction: .down))
            XCTAssert(board.canMove(tile: .square(instance: 4), direction: .left) == false)
            XCTAssert(board.canMove(tile: .square(instance: 4), direction: .right) == false)
        }
        square4assertions()
        board.move(tile: .square(instance: 4), direction: .left)
        square4assertions()
        board.move(tile: .square(instance: 4), direction: .right)
        square4assertions()
        
        board.move(tile: .square(instance: 3), direction: .right)
        
        let square3assertions = {
            self.note(board)
            XCTAssert(board.description == " .°.←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 3), direction: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 3), direction: .down) == false)
            XCTAssert(board.canMove(tile: .square(instance: 3), direction: .left))
            XCTAssert(board.canMove(tile: .square(instance: 3), direction: .right) == false)
        }
        square3assertions()
        board.move(tile: .square(instance: 3), direction: .right)
        square3assertions()
        board.move(tile: .square(instance: 3), direction: .up)
        square3assertions()
        board.move(tile: .square(instance: 3), direction: .down)
        square3assertions()
    }
    
    func test_horizontal_lead_can_move_left_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_left_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
    }
    
    func test_horizontal_lead_can_move_left_then_right_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .right)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), direction: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_left_then_right_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .right)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_down_to_bounds() {
        let board = Board()
        board.jar = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .down)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°.←.→\n↑. . . \n↓. . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
            default:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. . . \n↓. .←.→\n")
            }
        }
    }
    
    func test_horizontal_trail_can_move_down_and_up_to_bounds() {
        let board = Board()
        board.jar = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .down)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°.←.→\n↑. . . \n↓. . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
            default:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. . . \n↓. .←.→\n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .up)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°.←.→\n↑. . . \n↓. . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
            default:
                XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
            }
        }
    }
    
    func test_horizontal_trail_can_move_random_movements() {
        let board = Board()
        board.jar = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...3 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .down)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
                board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
                board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .right)
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°.←.→\n↑. . . \n↓. . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
            default:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. . . \n↓. .←.→\n")
            }
        }
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .right)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .left)
        note(board)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑.←.→. \n↓. . . \n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), direction: .up)
        note(board)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑.←.→. \n↓. . . \n")
    }
    
    func test_horizontal_can_move_around(segment: Tile.Segment = .trail) {
        let board = Board()
        board.jar = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .none, .square(instance: 1), .none, .none,
            .none, .square(instance: 3), .none, .none,
            .none, .none, .none, .none,
            .none, .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n .°. . \n .°. . \n . . . \n . . . \n")

        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), direction: .down)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°.←.→\n .°. . \n . . . \n . . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n .°. . \n .°.←.→\n . . . \n . . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . .←.→\n . . . \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . . . \n . .←.→\n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), direction: .left)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . . . \n .←.→. \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . . . \n←.→. . \n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), direction: .up)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n←.→. . \n . . . \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n←.→. . \n . . . \n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), direction: .right)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n .←.→. \n . . . \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . .←.→\n . . . \n")
            }
        }
        
    }

    func test_horizontal_lead_can_move_around() {
        test_horizontal_can_move_around(segment: .lead)
    }
    
    func test_horizontal_trail_can_move_around() {
        test_horizontal_can_move_around(segment: .trail)
    }

    
}
