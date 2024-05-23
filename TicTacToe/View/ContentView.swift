//
//  ContentView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    VStack(alignment: .leading, spacing: 32) {
                        CellGroupView(
                            newGame: !vm.gameStarted,
                            isPlayer1: vm.isPlayer1,
                            playerType: vm.fillCell(),
                            changePlayers: vm.changePlayers
                        )
                        .onAppear {
                            vm.startGame()
                        }
                        
                        ScoreView(
                            player1Score: vm.player1Score,
                            player2Score: vm.player2Score
                        )
                        
                        Spacer()
                        
                        RestartButtonView(restartAction: vm.restartGame)
                        
                        Spacer()

                    }
                    
                }
            }
            .navigationTitle("TicTacToe")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
