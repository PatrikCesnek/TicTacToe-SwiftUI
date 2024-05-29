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
    @Published var isLoading = true
    let duration: Double = 1.5
    
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
        isLoading = false
    }
    
    func restartGame() {
        gameStarted = false
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.startGame()
        }
    }
    
    func changePlayers() {
        isPlayer1.toggle()
    }
}
