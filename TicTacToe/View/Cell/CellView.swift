//
//  CellView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct CellView: View {
    @State private var placeholder = ""
    @State private var isDisabled = false
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
        self.playerType = playerType
        self.isPlayer1 = isPlayer1
        self.changePlayers = changePlayers
    }
    
    var body: some View {
        Button(
            action: {
                placeholder = playerType
                isDisabled = true
                changePlayers()
            },
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray)
                    VStack {
                        // either Image(systemName: "xmark") or Image(systemName: "circle")
                        
                        Text(newGame ? "" : placeholder)
                            .font(.system(size: 40, weight: .bold))
                        }
                }
            }
        )
        .disabled(isDisabled)
    }
}

#Preview {
    CellView(
        newGame: false,
        isPlayer1: true,
        playerType: "X",
        changePlayers: {}
    )
}
