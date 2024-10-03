import Observation

@Observable class GameLogic {
    var robotChoice: Sign = .rock
    var playerChoice: Sign?
    var gameStatusMessage = "Rock, Paper, Scissors?"
    
    func resetGame() {
        playerChoice = nil
        gameStatusMessage = "Rock, Paper, Scissors?"
    }
    
    func playerChose(_ sign: Sign) {
        playerChoice = sign
        robotChoice = Sign.allCases.randomElement()!
        determinWinner(playerChoice: sign, robotChoice: robotChoice)
    }
    
    func determinWinner(playerChoice: Sign, robotChoice: Sign) {
        if playerChoice  == robotChoice {
            gameStatusMessage = "It's a tie!"
        } else if playerChoice == .rock && robotChoice == .scissors || playerChoice == .paper && robotChoice == .rock || playerChoice == .scissors && robotChoice == .paper {
            gameStatusMessage = "You win!"
        } else {
            gameStatusMessage = "You lose!"
        }
    }
}
