import SwiftUI

struct BlinkViewModifier: ViewModifier {
    let duration: Double
    let blinkFrequency: Double
    @State private var blinking: Bool = false
    @State private var startBlinking: Bool = true
    
    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.4 : 0.8)
            .animation(
                Animation.easeInOut(duration: 1 / blinkFrequency)
                    .repeatForever(autoreverses: true),
                value: blinking
            )
            .onAppear {
                startBlinkingAnimation()
            }
    }
    
    private func startBlinkingAnimation() {
        blinking = true
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            startBlinking = false
        }
        
        Timer.scheduledTimer(withTimeInterval: 1 / blinkFrequency, repeats: true) { timer in
            if startBlinking {
                blinking.toggle()
            } else {
                timer.invalidate()
                blinking = false
            }
        }
    }
}

extension View {
    func blinking(duration: Double, blinkFrequency: Double = 2.5) -> some View {
        self.modifier(BlinkViewModifier(duration: duration, blinkFrequency: blinkFrequency))
    }
}
