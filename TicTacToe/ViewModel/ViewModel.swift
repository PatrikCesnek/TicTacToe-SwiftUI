//
//  ViewModel.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 23/05/2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var isPlayer1 = true
    @Published var player1Score = 0
    @Published var player2Score = 0
    @Published var gameStarted = false
    
    func fillCell() -> String {
        guard gameStarted else {
            return ""
        }
        
        if isPlayer1 {
            return "X"
        } else {
            return "O"
        }
    }
    
    func startGame() {
        gameStarted = true
    }
    
    func restartGame() {
        gameStarted = false
        player1Score = 0
        player2Score = 0
        
        //Somehow start game startGame()
    }
    
    func changePlayers() {
        isPlayer1.toggle()
    }
}
