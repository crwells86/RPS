import SwiftUI

struct ContentView: View {
    @State private var gameLogic = GameLogic()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(gameLogic.playerChoice != nil ? gameLogic.robotChoice.rawValue : "🤖")
                .font(.system(size: 80))
            
            Text(gameLogic.gameStatusMessage)
                .font(.title)
            
            HStack {
                if gameLogic.playerChoice == nil {
                    ForEach(Sign.allCases, id: \.self) { sign in
                        Button {
                            gameLogic.playerChose(sign)
                        } label: {
                            Text(sign.rawValue)
                                .font(.system(size: 80))
                        }
                    }
                } else {
                    Text(gameLogic.playerChoice!.rawValue)
                        .font(.system(size: 80))
                }
            }
            
            Spacer()
            
            Button {
                gameLogic.resetGame()
            } label: {
                Text("Reset")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
