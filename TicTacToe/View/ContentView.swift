//
//  ContentView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                
                Text("Current Player: \(viewModel.currentPlayer == .x ? "X" : "O")")
                    .font(.title)
                    .padding()
                                
                VStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { row in
                        HStack(spacing: 8) {
                            ForEach(0..<3, id: \.self) { col in
                                CellView(player: viewModel.board[row][col])
                                    .onTapGesture {
                                        viewModel.makeMove(at: row, column: col, player: viewModel.currentPlayer)
                                        let winner = viewModel.checkWinner()
                                        if winner != .none {
                                            print("\(winner) wins!")
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom], 16)
                                
                RestartButtonView(restartAction: viewModel.restartGame)
                
                Spacer()
                                
            }
        }
    }
}


#Preview {
    ContentView()
}
