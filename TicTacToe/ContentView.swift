//
//  ContentView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlayer1 = true
    @State private var player1Score = 0
    @State private var player2Score = 0
    @State private var gameStarted = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    VStack(alignment: .leading, spacing: 32) {
                        CellGroupView(
                            newGame: !gameStarted,
                            isPlayer1: isPlayer1,
                            playerType: fillCell(gameStarted: gameStarted, isPlayer1: isPlayer1),
                            changePlayers: {
                                isPlayer1.toggle()
                            }
                        )
                        .onAppear {
                            gameStarted = true
                        }
                        
                        ScoreView(
                            player1Score: player1Score,
                            player2Score: player2Score
                        )
                        
                        Spacer()
                        
                        RestartButtonView(restartAction: {
                            gameStarted = false
                            player1Score = 0
                            player2Score = 0
                        })
                        
                        Spacer()

                    }
                    
                }
            }
            .navigationTitle("TicTacToe")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func fillCell(gameStarted: Bool, isPlayer1: Bool) -> String {
        guard gameStarted else {
            return ""
        }
        
        if isPlayer1 {
            return "X"
        } else {
            return "O"
        }
    }
}

#Preview {
    ContentView()
}
