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
                        if vm.isLoading {
                            SkeletonPlaceholderView(duration: vm.duration)
                            
                        } else {
                            CellGroupView(
                                newGame: !vm.gameStarted,
                                isPlayer1: vm.isPlayer1,
                                playerType: vm.fillCell(),
                                changePlayers: vm.changePlayers
                            )
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
                .onAppear {
                    vm.startGame()
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
