import Foundation

public class Player {
    var turn: Bool = false
    var isToPlay: Bool {
        if turn {
            return true
        }
        return false
    }
    
    var score: Int = 0
    var playerNumber: Int
    var choice: Int?
    
    public init(playerNumber: Int) {
        self.playerNumber = playerNumber
    }
    
    public func setTurn() {
        self.turn = true
    }
    
    public func setScore(to newScore: Int) {
        self.score = newScore
    }
    
    public func getScore() -> Int {
        return self.score
    }
    
    //trying the players to get to play
    public func play() -> Int {
        return 0
    }
    
    
}
