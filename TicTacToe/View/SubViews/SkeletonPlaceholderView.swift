//
//  SkeletonPlaceholderView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 27/05/2024.
//

import SwiftUI

struct SkeletonPlaceholderView: View {
    private let duration: Double
    
    init(duration: Double) {
        self.duration = duration
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(spacing: 16) {
                ForEach(0..<3) { _ in
                    HStack(spacing: 16) {
                        ForEach(0...2, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray)
                        }
                    }
                }
            }
            .padding(16)
            
            ScoreView(
                player1Score: 0,
                player2Score: 0
            )
            
            Spacer()
            
            RestartButtonView(restartAction: {})
            
            Spacer()

        }
        .opacity(0.6)
        .blinking(duration: duration)
    }
}

#Preview {
    SkeletonPlaceholderView(duration: 10)
}
