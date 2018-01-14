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
        //print("[\n\(board)]")
    }
    
    func test_klotski_solution() {
        let board = Board()

        board.move(tile: .square(instance: 1), moving: .up)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.move(tile: .square(instance: 1), moving: .left)
        XCTAssert(board.description == "°. .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "°. .←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "°.°.←.→\n↑. .°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .right)
        XCTAssert(board.description == "°.°.←.→\n .↑.°.↑\n .↓.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .up)
        XCTAssert(board.description == "°.°.←.→\n .↑.°.↑\n↑.↓.°.↓\n↓.O.O.↑\n .O.O.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .up)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°.↑\n↓.↓.°.↓\n .O.O.↑\n .O.O.↓\n")
        board.move(tile: .block(row: .top, col: .lead), moving: .left)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°.↑\n↓.↓.°.↓\nO.O. .↑\nO.O. .↓\n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .left)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°.↑\n↓.↓.°.↓\nO.O.↑. \nO.O.↓. \n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°. \n↓.↓.°.↑\nO.O.↑.↓\nO.O.↓. \n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°. \n↓.↓.°. \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .right)
        XCTAssert(board.description == "°.°.←.→\n↑.↑.°. \n↓.↓. .°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .down)
        XCTAssert(board.description == "°.°.←.→\n↑.↑. . \n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .down)
        XCTAssert(board.description == "°.°. . \n↑.↑.←.→\n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .right)
        XCTAssert(board.description == "°. .°. \n↑.↑.←.→\n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .right)
        XCTAssert(board.description == "°. . .°\n↑.↑.←.→\n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == " .°. .°\n↑.↑.←.→\n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == " . .°.°\n↑.↑.←.→\n↓.↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .up)
        XCTAssert(board.description == "↑. .°.°\n↓.↑.←.→\n .↓.°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .up)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓.←.→\n . .°.°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .left)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓.←.→\n .°. .°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .left)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓.←.→\n°. . .°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .left)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓.←.→\n°. .°. \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .left)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓.←.→\n°.°. . \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .down)
        XCTAssert(board.description == "↑.↑.°.°\n↓.↓. . \n°.°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "↑.↑.°. \n↓.↓. .°\n°.°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == "↑.↑. .°\n↓.↓. .°\n°.°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .right)
        XCTAssert(board.description == "↑. .↑.°\n↓. .↓.°\n°.°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .right)
        XCTAssert(board.description == " .↑.↑.°\n .↓.↓.°\n°.°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .up)
        XCTAssert(board.description == " .↑.↑.°\n°.↓.↓.°\n .°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .up)
        XCTAssert(board.description == "°.↑.↑.°\n .↓.↓.°\n .°.←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .left)
        XCTAssert(board.description == "°.↑.↑.°\n .↓.↓.°\n°. .←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .up)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.°\n . .←.→\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.°\n .←.→. \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.°\n←.→. . \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓. \n←.→. .°\nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .left)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓. \n←.→.°. \nO.O.↑.↑\nO.O.↓.↓\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .up)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓. \n←.→.°.↑\nO.O.↑.↓\nO.O.↓. \n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .up)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.↑\n←.→.°.↓\nO.O.↑. \nO.O.↓. \n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .right)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.↑\n←.→.°.↓\nO.O. .↑\nO.O. .↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.↑\n←.→. .↓\nO.O.°.↑\nO.O. .↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "°.↑.↑.°\n°.↓.↓.↑\n←.→. .↓\nO.O. .↑\nO.O.°.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .down)
        XCTAssert(board.description == "°.↑. .°\n°.↓.↑.↑\n←.→.↓.↓\nO.O. .↑\nO.O.°.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .down)
        XCTAssert(board.description == "°.↑. .°\n°.↓. .↑\n←.→.↑.↓\nO.O.↓.↑\nO.O.°.↓\n")
        board.move(tile: .square(instance: 1), moving: .left)
        XCTAssert(board.description == "°.↑.°. \n°.↓. .↑\n←.→.↑.↓\nO.O.↓.↑\nO.O.°.↓\n")
        board.move(tile: .square(instance: 1), moving: .down)
        XCTAssert(board.description == "°.↑. . \n°.↓.°.↑\n←.→.↑.↓\nO.O.↓.↑\nO.O.°.↓\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .up)
        XCTAssert(board.description == "°.↑. .↑\n°.↓.°.↓\n←.→.↑. \nO.O.↓.↑\nO.O.°.↓\n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .up)
        XCTAssert(board.description == "°.↑. .↑\n°.↓.°.↓\n←.→.↑.↑\nO.O.↓.↓\nO.O.°. \n")
        board.move(tile: .square(instance: 3), moving: .right)
        XCTAssert(board.description == "°.↑. .↑\n°.↓.°.↓\n←.→.↑.↑\nO.O.↓.↓\nO.O. .°\n")
        board.move(tile: .vertical(instance: 2, segment: .bottom), moving: .down)
        XCTAssert(board.description == "°.↑. .↑\n°.↓.°.↓\n←.→. .↑\nO.O.↑.↓\nO.O.↓.°\n")
        board.move(tile: .square(instance: 1), moving: .down)
        XCTAssert(board.description == "°.↑. .↑\n°.↓. .↓\n←.→.°.↑\nO.O.↑.↓\nO.O.↓.°\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .left)
        XCTAssert(board.description == "°.↑.↑. \n°.↓.↓. \n←.→.°.↑\nO.O.↑.↓\nO.O.↓.°\n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .up)
        XCTAssert(board.description == "°.↑.↑. \n°.↓.↓.↑\n←.→.°.↓\nO.O.↑. \nO.O.↓.°\n")
        board.move(tile: .vertical(instance: 5, segment: .bottom), moving: .up)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→.°. \nO.O.↑. \nO.O.↓.°\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→.°. \nO.O.↑.°\nO.O.↓. \n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→.°.°\nO.O.↑. \nO.O.↓. \n")
        board.move(tile: .vertical(instance: 2, segment: .bottom), moving: .right)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→.°.°\nO.O. .↑\nO.O. .↓\n")
        board.move(tile: .square(instance: 1), moving: .down)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. .°\nO.O.°.↑\nO.O. .↓\n")
        board.move(tile: .square(instance: 1), moving: .down)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. .°\nO.O. .↑\nO.O.°.↓\n")
        board.move(tile: .square(instance: 3), moving: .left)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→.°. \nO.O. .↑\nO.O.°.↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. . \nO.O.°.↑\nO.O.°.↓\n")
        board.move(tile: .vertical(instance: 2, segment: .bottom), moving: .up)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. .↑\nO.O.°.↓\nO.O.°. \n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. .↑\nO.O.°.↓\nO.O. .°\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "°.↑.↑.↑\n°.↓.↓.↓\n←.→. .↑\nO.O. .↓\nO.O.°.°\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .down)
        XCTAssert(board.description == "°.↑. .↑\n°.↓.↑.↓\n←.→.↓.↑\nO.O. .↓\nO.O.°.°\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .down)
        XCTAssert(board.description == "°.↑. .↑\n°.↓. .↓\n←.→.↑.↑\nO.O.↓.↓\nO.O.°.°\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .right)
        XCTAssert(board.description == "°. .↑.↑\n°. .↓.↓\n←.→.↑.↑\nO.O.↓.↓\nO.O.°.°\n")
        board.move(tile: .square(instance: 2), moving: .right)
        XCTAssert(board.description == " .°.↑.↑\n°. .↓.↓\n←.→.↑.↑\nO.O.↓.↓\nO.O.°.°\n")
        board.move(tile: .square(instance: 4), moving: .up)
        XCTAssert(board.description == "°.°.↑.↑\n . .↓.↓\n←.→.↑.↑\nO.O.↓.↓\nO.O.°.°\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .up)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\n . .↑.↑\nO.O.↓.↓\nO.O.°.°\n")
        board.move(tile: .block(row: .top, col: .trail), moving: .up)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O.↑.↑\nO.O.↓.↓\n . .°.°\n")
        board.move(tile: .square(instance: 3), moving: .left)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O.↑.↑\nO.O.↓.↓\n .°. .°\n")
        board.move(tile: .square(instance: 3), moving: .left)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O.↑.↑\nO.O.↓.↓\n°. . .°\n")
        board.move(tile: .square(instance: 1), moving: .left)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O.↑.↑\nO.O.↓.↓\n°. .°. \n")
        board.move(tile: .square(instance: 1), moving: .left)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O.↑.↑\nO.O.↓.↓\n°.°. . \n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O. .↑\nO.O.↑.↓\n°.°.↓. \n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°.↑.↑\n←.→.↓.↓\nO.O. . \nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°. .↑\n←.→.↑.↓\nO.O.↓. \nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .down)
        XCTAssert(board.description == "°.°. . \n←.→.↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .right)
        XCTAssert(board.description == "°. .°. \n←.→.↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .right)
        XCTAssert(board.description == "°. . .°\n←.→.↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .right)
        XCTAssert(board.description == " .°. .°\n←.→.↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .right)
        XCTAssert(board.description == " . .°.°\n←.→.↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .up)
        XCTAssert(board.description == "←.→.°.°\n . .↑.↑\nO.O.↓.↓\nO.O.↑.↑\n°.°.↓.↓\n")
        board.move(tile: .block(row: .top, col: .lead), moving: .up)
        XCTAssert(board.description == "←.→.°.°\nO.O.↑.↑\nO.O.↓.↓\n . .↑.↑\n°.°.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "←.→.°.°\nO.O.↑.↑\nO.O.↓.↓\n°. .↑.↑\n .°.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .left)
        XCTAssert(board.description == "←.→.°.°\nO.O.↑.↑\nO.O.↓.↓\n°. .↑.↑\n°. .↓.↓\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .left)
        XCTAssert(board.description == "←.→.°.°\nO.O.↑.↑\nO.O.↓.↓\n°.↑. .↑\n°.↓. .↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .down)
        XCTAssert(board.description == "←.→.°.°\nO.O. .↑\nO.O.↑.↓\n°.↑.↓.↑\n°.↓. .↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .down)
        XCTAssert(board.description == "←.→.°.°\nO.O. .↑\nO.O. .↓\n°.↑.↑.↑\n°.↓.↓.↓\n")
        board.move(tile: .block(row: .top, col: .trail), moving: .right)
        XCTAssert(board.description == "←.→.°.°\n .O.O.↑\n .O.O.↓\n°.↑.↑.↑\n°.↓.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "←.→.°.°\n .O.O.↑\n°.O.O.↓\n .↑.↑.↑\n°.↓.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .up)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n .O.O.↓\n .↑.↑.↑\n°.↓.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .up)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n .O.O.↓\n°.↑.↑.↑\n .↓.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .up)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n°.O.O.↓\n .↑.↑.↑\n .↓.↓.↓\n")
        board.move(tile: .vertical(instance: 3, segment: .top), moving: .left)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n°.O.O.↓\n↑. .↑.↑\n↓. .↓.↓\n")
        board.move(tile: .vertical(instance: 4, segment: .top), moving: .left)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n°.O.O.↓\n↑.↑. .↑\n↓.↓. .↓\n")
        board.move(tile: .vertical(instance: 2, segment: .top), moving: .left)
        XCTAssert(board.description == "←.→.°.°\n°.O.O.↑\n°.O.O.↓\n↑.↑.↑. \n↓.↓.↓. \n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .down)
        XCTAssert(board.description == "←.→.°.°\n°.O.O. \n°.O.O.↑\n↑.↑.↑.↓\n↓.↓.↓. \n")
        board.move(tile: .vertical(instance: 5, segment: .top), moving: .down)
        XCTAssert(board.description == "←.→.°.°\n°.O.O. \n°.O.O. \n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .block(row: .bottom, col: .trail), moving: .right)
        XCTAssert(board.description == "←.→.°.°\n°. .O.O\n°. .O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == "←.→.°.°\n°. .O.O\n .°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .down)
        XCTAssert(board.description == "←.→.°.°\n . .O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .down)
        XCTAssert(board.description == " . .°.°\n←.→.O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .left)
        XCTAssert(board.description == " .°. .°\n←.→.O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 4), moving: .left)
        XCTAssert(board.description == "°. . .°\n←.→.O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .left)
        XCTAssert(board.description == "°. .°. \n←.→.O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .left)
        XCTAssert(board.description == "°.°. . \n←.→.O.O\n°.°.O.O\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .block(row: .top, col: .trail), moving: .up)
        XCTAssert(board.description == "°.°.O.O\n←.→.O.O\n°.°. . \n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == "°.°.O.O\n←.→.O.O\n°. .°. \n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 1), moving: .right)
        XCTAssert(board.description == "°.°.O.O\n←.→.O.O\n°. . .°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .right)
        XCTAssert(board.description == "°.°.O.O\n←.→.O.O\n .°. .°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 3), moving: .right)
        XCTAssert(board.description == "°.°.O.O\n←.→.O.O\n . .°.°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .down)
        XCTAssert(board.description == "°.°.O.O\n . .O.O\n←.→.°.°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .down)
        XCTAssert(board.description == "°. .O.O\n .°.O.O\n←.→.°.°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        board.move(tile: .square(instance: 2), moving: .left)
        XCTAssert(board.description == "°. .O.O\n°. .O.O\n←.→.°.°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        XCTAssert(board.isWin == false)
        board.move(tile: .block(row: .top, col: .trail), moving: .left)
        XCTAssert(board.description == "°.O.O. \n°.O.O. \n←.→.°.°\n↑.↑.↑.↑\n↓.↓.↓.↓\n")
        XCTAssert(board.isWin)
    }

    func test_is_index_bound() {
        let board = Board()
        
        note(board)

        XCTAssert(board.isIndexBound(-4, by: .up, from: 0) == false )
        XCTAssert(board.isIndexBound(23, by: .down, from: 19) == false )
        XCTAssert(board.isIndexBound(7, by: .left, from: 8) == false )
        XCTAssert(board.isIndexBound(8, by: .right, from: 7) == false )
        XCTAssert(board.isIndexBound(1, by: .up, from: 5) == true )
        XCTAssert(board.isIndexBound(5, by: .down, from: 1) == true )
        XCTAssert(board.isIndexBound(13, by: .left, from: 12) == true )
        XCTAssert(board.isIndexBound(12, by: .right, from: 13) == true )
        XCTAssert(board.isIndexBound(0, by: .left, from: 1) == true )
        XCTAssert(board.isIndexBound(-1, by: .left, from: 0) == false )
        XCTAssert(board.isIndexBound(19, by: .right, from: 18) == true )
        XCTAssert(board.isIndexBound(20, by: .right, from: 19) == false )
    }

    func test_segment_indexes_for_current() {
        let board = Board()
        
        note(board)

        XCTAssert(board.segmentIndexes(for: 0) == [] )
        XCTAssert(board.segmentIndexes(for: 1) == [] )
        XCTAssert(board.segmentIndexes(for: 2) == [2, 3] )
        XCTAssert(board.segmentIndexes(for: 3) == [2, 3] )
        XCTAssert(board.segmentIndexes(for: 4) == [4, 8] )
        XCTAssert(board.segmentIndexes(for: 5) == [5] )
        XCTAssert(board.segmentIndexes(for: 6) == [6] )
        XCTAssert(board.segmentIndexes(for: 7) == [7, 11] )
        XCTAssert(board.segmentIndexes(for: 8) == [4, 8] )
        XCTAssert(board.segmentIndexes(for: 9) == [9] )
        XCTAssert(board.segmentIndexes(for: 10) == [10] )
        XCTAssert(board.segmentIndexes(for: 11) == [7, 11] )
        XCTAssert(board.segmentIndexes(for: 12) == [12, 16] )
        XCTAssert(board.segmentIndexes(for: 13) == [13, 14, 17, 18] )
        XCTAssert(board.segmentIndexes(for: 14) == [13, 14, 17, 18] )
        XCTAssert(board.segmentIndexes(for: 15) == [15, 19] )
        XCTAssert(board.segmentIndexes(for: 16) == [12, 16] )
        XCTAssert(board.segmentIndexes(for: 17) == [13, 14, 17, 18] )
        XCTAssert(board.segmentIndexes(for: 18) == [13, 14, 17, 18] )
        XCTAssert(board.segmentIndexes(for: 19) == [15, 19] )
    }
    
    func test_offset() {
        let board = Board()
        XCTAssert(board.offset(moving: .up) == -board.width)
        XCTAssert(board.offset(moving: .down) == board.width)
        XCTAssert(board.offset(moving: .left) == -1)
        XCTAssert(board.offset(moving: .right) == 1)
    }
    
    func test_displace_square() {
        var board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")

        board.displace(segments: [5], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [5], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [5], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [5], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")

        board = Board()
        board.displace(segments: [6], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [6], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [6], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [6], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")

        board = Board()
        board.displace(segments: [9], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [9], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [9], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [9], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")

        board = Board()
        board.displace(segments: [10], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [10], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [10], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [10], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }

    func test_displace_horizontal() {
        var board = Board()
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [2, 3], moving: .up)
        XCTAssert(board.description == " . . . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [2, 3], moving: .down)
        XCTAssert(board.description == " . . . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [2, 3], moving: .left)
        XCTAssert(board.description == " . .←. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [2, 3], moving: .right)
        XCTAssert(board.description == " . . .→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }

    func test_displace_vertical() {
        var board = Board()
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [4, 8], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n .°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [4, 8], moving: .down)
        XCTAssert(board.description == " . .←.→\n .°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [4, 8], moving: .left)
        XCTAssert(board.description == " . .←.→\n .°.°.↑\n .°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [4, 8], moving: .right)
        XCTAssert(board.description == " . .←.→\n .°.°.↑\n .°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_displace_block() {
        var board = Board()
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.displace(segments: [13, 14, 17, 18], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓. . .↓\n")
        board = Board()
        board.displace(segments: [13, 14, 17, 18], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑. . .↑\n↓.O.O.↓\n")
        board = Board()
        board.displace(segments: [13, 14, 17, 18], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O. .↑\n↓.O. .↓\n")
        board = Board()
        board.displace(segments: [13, 14, 17, 18], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑. .O.↑\n↓. .O.↓\n")
    }
    
    func test_copy_square() {
        var board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.copy(segments: [5], moving: .up)
        XCTAssert(board.description == " .°.←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [5], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [5], moving: .left)
        XCTAssert(board.description == " . .←.→\n°.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [6], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°.°.°\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [9], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.°.O.↑\n↓.O.O.↓\n")
    }
    
    func test_copy_horizontal() {
        var board = Board()
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.copy(segments: [2, 3], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.←.→\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [2, 3], moving: .left)
        XCTAssert(board.description == " .←.→.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_copy_vertical() {
        var board = Board()
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.copy(segments: [4, 8], moving: .up)
        XCTAssert(board.description == "↑. .←.→\n↓.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [4, 8], moving: .down)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↑.°.°.↓\n↓.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [4, 8], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.↑.°.↑\n↓.↓.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [7, 11], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°.↑.↑\n↓.°.↓.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_copy_block() {
        var board = Board()
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board.copy(segments: [13, 14, 17, 18], moving: .up)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.O.O.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        board = Board()
        board.copy(segments: [13, 14, 17, 18], moving: .left)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\nO.O.O.↑\nO.O.O.↓\n")
        board = Board()
        board.copy(segments: [13, 14, 17, 18], moving: .right)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.O\n↓.O.O.O\n")
    }
    
    func test_square_can_move_up_then_down() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        board.move(tile: .square(instance: 1), moving: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        board.move(tile: .square(instance: 1), moving: .down)
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
    }
    
    func test_square_can_move_left_and_right() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        board.move(tile: .square(instance: 1), moving: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        board.move(tile: .square(instance: 1), moving: .left)
        
        note(board)
        XCTAssert(board.description == "°. .←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right))
        
        board.move(tile: .square(instance: 1), moving: .right)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
    }
    
    func test_squares_can_move_around() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        board.move(tile: .square(instance: 1), moving: .up)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .down))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .left))
        XCTAssert(board.canMove(tile: .square(instance: 1), moving: .right) == false)
        
        let square2assertions = {
            XCTAssert(board.description == " .°.←.→\n↑. .°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 2), moving: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 2), moving: .down) == false)
            XCTAssert(board.canMove(tile: .square(instance: 2), moving: .left))
            XCTAssert(board.canMove(tile: .square(instance: 2), moving: .right) == false)
        }
        board.move(tile: .square(instance: 2), moving: .up)
        square2assertions()
        board.move(tile: .square(instance: 2), moving: .right)
        square2assertions()
        board.move(tile: .square(instance: 2), moving: .down)
        square2assertions()
        
        board.move(tile: .square(instance: 2), moving: .left)
        
        note(board)
        XCTAssert(board.description == " .°.←.→\n↑.°. .↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        XCTAssert(board.canMove(tile: .square(instance: 2), moving: .up) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), moving: .down) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), moving: .left) == false)
        XCTAssert(board.canMove(tile: .square(instance: 2), moving: .right))
        
        board.move(tile: .square(instance: 4), moving: .up)
        
        let square4assertions = {
            self.note(board)
            XCTAssert(board.description == " .°.←.→\n↑.°.°.↑\n↓.°. .↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 4), moving: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 4), moving: .down))
            XCTAssert(board.canMove(tile: .square(instance: 4), moving: .left) == false)
            XCTAssert(board.canMove(tile: .square(instance: 4), moving: .right) == false)
        }
        square4assertions()
        board.move(tile: .square(instance: 4), moving: .left)
        square4assertions()
        board.move(tile: .square(instance: 4), moving: .right)
        square4assertions()
        
        board.move(tile: .square(instance: 3), moving: .right)
        
        let square3assertions = {
            self.note(board)
            XCTAssert(board.description == " .°.←.→\n↑.°.°.↑\n↓. .°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
            XCTAssert(board.canMove(tile: .square(instance: 3), moving: .up) == false)
            XCTAssert(board.canMove(tile: .square(instance: 3), moving: .down) == false)
            XCTAssert(board.canMove(tile: .square(instance: 3), moving: .left))
            XCTAssert(board.canMove(tile: .square(instance: 3), moving: .right) == false)
        }
        square3assertions()
        board.move(tile: .square(instance: 3), moving: .right)
        square3assertions()
        board.move(tile: .square(instance: 3), moving: .up)
        square3assertions()
        board.move(tile: .square(instance: 3), moving: .down)
        square3assertions()
    }
    
    func test_horizontal_lead_can_move_left_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_left_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
    }
    
    func test_horizontal_lead_can_move_left_then_right_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .right)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .lead), moving: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_left_then_right_to_bounds() {
        let board = Board()
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == "←.→. . \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .right)
        note(board)
        XCTAssert(board.description == " .←.→. \n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .right)
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°.°.↑\n↓.°.°.↓\n↑.O.O.↑\n↓.O.O.↓\n")
    }
    
    func test_horizontal_trail_can_move_down_to_bounds() {
        let board = Board()
        board.tiles = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .down)
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
        board.tiles = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .down)
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
            board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .up)
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
        board.tiles = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .vertical(instance: 2, segment: .top), .square(instance: 1), .none, .none,
            .vertical(instance: 2, segment: .bottom), .square(instance: 3), .none, .none,
            .vertical(instance: 4, segment: .top), .none, .none, .none,
            .vertical(instance: 4, segment: .bottom), .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n↑.°. . \n↓.°. . \n↑. . . \n↓. . . \n")
        
        for i in 1...3 {
            board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .down)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
                board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
                board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .right)
                XCTAssert(board.description == " . . . \n↑.°.←.→\n↓.°. . \n↑. . . \n↓. . . \n")
            case 2:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°.←.→\n↑. . . \n↓. . . \n")
            case 3:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
            default:
                XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. . . \n↓. .←.→\n")
            }
        }
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .right)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑. .←.→\n↓. . . \n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .left)
        note(board)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑.←.→. \n↓. . . \n")
        
        board.move(tile: .horizontal(instance: 1, segment: .trail), moving: .up)
        note(board)
        XCTAssert(board.description == " . . . \n↑.°. . \n↓.°. . \n↑.←.→. \n↓. . . \n")
    }
    
    func test_horizontal_can_move_around(segment: Tile.Segment = .trail) {
        let board = Board()
        board.tiles = [
            .none, .none, .horizontal(instance: 1, segment: .lead), .horizontal(instance: 1, segment: .trail),
            .none, .square(instance: 1), .none, .none,
            .none, .square(instance: 3), .none, .none,
            .none, .none, .none, .none,
            .none, .none, .none, .none
        ]
        
        note(board)
        XCTAssert(board.description == " . .←.→\n .°. . \n .°. . \n . . . \n . . . \n")

        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), moving: .down)
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
            board.move(tile: .horizontal(instance: 1, segment: segment), moving: .left)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . . . \n .←.→. \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n . . . \n←.→. . \n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), moving: .up)
            note(board)
            
            switch i {
            case 1:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n←.→. . \n . . . \n")
            default:
                XCTAssert(board.description == " . . . \n .°. . \n .°. . \n←.→. . \n . . . \n")
            }
        }
        
        for i in 1...6 {
            board.move(tile: .horizontal(instance: 1, segment: segment), moving: .right)
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
