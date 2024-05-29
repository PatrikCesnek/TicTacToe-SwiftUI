//
//  ScoreView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 22/05/2024.
//

import SwiftUI

struct ScoreView: View {
    private let player1Score: Int
    private let player2Score: Int
    
    init(player1Score: Int, player2Score: Int) {
        self.player1Score = player1Score
        self.player2Score = player2Score
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 16) {
                Text("Score")
                    .font(.system(size: 24, weight: .black))
                
                VStack {
                    Text("Player 1: \(String(format: "%03d", player1Score))")
                    Text("Player 2: \(String(format: "%03d", player2Score))")
                }
                .font(.system(size: 24, weight: .semibold))
            }
            .padding(16)
            
            Spacer()
        }
        .background(Color.gray)
    }
}

#Preview {
    ScoreView(player1Score: 100, player2Score: 150)
}
