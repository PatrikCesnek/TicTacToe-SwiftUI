//
//  Player.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 30/05/2024.
//

import SwiftUI

enum Player {
    case none
    case x
    case o
}

struct TicTacToe {
    private(set) var board: [[Player]]
    
    init() {
        board = Array(repeating: Array(repeating: .none, count: 3), count: 3)
    }
    
    mutating func makeMove(at row: Int, column: Int, player: Player) {
        guard board[row][column] == .none else { return }
        board[row][column] = player
    }
}
