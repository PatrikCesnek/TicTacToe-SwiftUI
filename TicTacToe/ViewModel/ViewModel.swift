//
//  ViewModel.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 23/05/2024.
//

import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published private var game = TicTacToe()
    @Published private(set) var currentPlayer: Player = .x
    @Published var isShowingAlert = false
    var alertText = ""
    
    var board: [[Player]] {
        return game.board
    }
    
    func makeMove(at row: Int, column: Int, player: Player) {
        game.makeMove(at: row, column: column, player: player)
        
        if currentPlayer == .x {
            currentPlayer = .o
        } else {
            currentPlayer = .x
        }
    }
    
    func checkWinner() -> Player {
        return determineWinner(board: game.board)
    }
    
    private func determineWinner(board: [[Player]]) -> Player {
        for row in 0..<3 {
            if board[row][0] != .none && board[row][0] == board[row][1] && board[row][1] == board[row][2] {
                return board[row][0]
            }
        }
        
        for col in 0..<3 {
            if board[0][col] != .none && board[0][col] == board[1][col] && board[1][col] == board[2][col] {
                return board[0][col]
            }
        }
        
        if board[0][0] != .none && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return board[0][0]
        }
        if board[0][2] != .none && board[0][2] == board[1][1] && board[1][1] == board[2][0] {
            return board[0][2]
        }
        
        return .none
    }
    
    func showAlert(winner: Player) {
        isShowingAlert = true
        alertText = "The winner is: \(winner)"
    }
    
    func restartGame() {
        game = TicTacToe()
        currentPlayer = .x
        isShowingAlert = false
        alertText = ""
    }
}
