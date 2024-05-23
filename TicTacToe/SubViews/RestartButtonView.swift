//
//  RestartButtonView.swift
//  TicTacToe
//
//  Created by Patrik Cesnek on 23/05/2024.
//

import SwiftUI

struct RestartButtonView: View {
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
                    .frame(width: 120, height: 40)
                    
                }
            )
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
    }
}

#Preview {
    RestartButtonView(restartAction: {})
}
