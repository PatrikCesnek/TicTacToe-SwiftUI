//
//  RestartButtonView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 23/05/2024.
//

import SwiftUI

struct RestartButtonView: View {
    let constants = Constants.init()
    private let restartAction: () -> Void
    
    init(restartAction: @escaping () -> Void) {
        self.restartAction = restartAction
    }
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(
                action: restartAction,
                label: {
                    HStack{
                        Text("Restart")
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(width: 160, height: 30)
                }
            )
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .shadow(color: constants.mainShadowColor, radius: 3, x: 1, y: 1)
            
            Spacer()
        }
    }
}

#Preview {
    RestartButtonView(restartAction: {})
}
