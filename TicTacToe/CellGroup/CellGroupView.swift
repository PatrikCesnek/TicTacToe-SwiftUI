//
//  CellGroupView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct CellGroupView: View {
    private let newGame: Bool
    private let isPlayer1: Bool
    private let playerType: String
    private let changePlayers: () -> Void
    
    init(
        newGame: Bool,
        isPlayer1: Bool,
        playerType: String,
        changePlayers: @escaping () -> Void
    ) {
        self.newGame = newGame
        self.isPlayer1 = isPlayer1
        self.playerType = playerType
        self.changePlayers = changePlayers
    }
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<3) { _ in
                HStack(spacing: 16) {
                    ForEach(0...2, id: \.self) { _ in
                        CellView(
                            newGame: newGame,
                            isPlayer1: isPlayer1,
                            playerType: playerType,
                            changePlayers: changePlayers
                        )
                    }
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    CellGroupView(
        newGame: false,
        isPlayer1: true,
        playerType: "X",
        changePlayers: {}
    )
}
