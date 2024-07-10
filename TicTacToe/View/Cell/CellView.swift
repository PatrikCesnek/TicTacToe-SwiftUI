//
//  CellView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 03/04/2024.
//

import SwiftUI

struct CellView: View {
    let constants = Constants.init()
    var player: Player
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(constants.mainGreyColor)
                .aspectRatio(1.0, contentMode: .fit)
            
            VStack {
                Text(playerSymbol)
                    .font(.system(size: 60, weight: .bold))
                    .foregroundStyle(getColor(player: player))
                    .shadow(color: constants.mainShadowColor, radius: 1, x: 0.5, y: 0.5)
            }
        }
    }
    
    private var playerSymbol: String {
        switch player {
        case .none:
            return ""
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
    
    private func getColor(player: Player?) -> Color {
        guard let player = player else {
            return .primary
        }
        
        if player == .x {
            return .red
        } else {
            return .blue
        }
    }
}

#Preview {
    CellView(player: Player.x)
}
