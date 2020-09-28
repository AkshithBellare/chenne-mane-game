import Foundation


public class Board {
    let Holes: Int
    let ShellsPerHole: Int
    var board: [Int] = [Int]()
    public init(Holes: Int, Shells: Int) {
        self.Holes         = Holes
        self.ShellsPerHole = Shells
        self.board = [Int](repeating: self.ShellsPerHole, count: self.Holes)
    }
    
    public func printBoard() {
          print("\n")
          for i in stride(from: 13, to: 6, by: -1) {
            print(self.board[i],"\t", terminator: "")
          }
          print("\n")
          for i in 0...6 {
            print(self.board[i],"\t", terminator: "")
          }
          print("\n")
    }
    
    public func isEmpty(at index: Int) -> Bool{
        if(self.board[index] == 0) {
            return true
        }
        return false
    }
    
    public func setValue(at index: Int, to value: Int) {
        self.board[index] = value
    }
    
    public func nextIndex(of index: Int) -> Int {
        return (index + 1)%(self.Holes)
    }
    
    public func prevIndex(of index: Int) -> Int {
        if(index == 0) {
            return 13
        }
        return index - 1
    }
    
    public func oppIndex(of index: Int) -> Int  {
        return LASTINDEX - index
    }
    
    public func moveShells(from index: Int) -> Int? {
        var shellsAtindex: Int = self.board[index]
        var capturedShells: Int? = nil
        var start: Int = nextIndex(of: index)
        while(shellsAtindex > 0) {
            board[start] += 1
            shellsAtindex -= 1
            start = nextIndex(of: start)
        }
        board[index] = 0
        if(board[start] > 0) {
            capturedShells = moveShells(from: start)
        } else if isEmpty(at: start) {
            if checkCaptureCondition(at: start) {
                capturedShells = capture(from: nextIndex(of: start))
                return capturedShells
            }
        }
        return capturedShells
    }
    
    func checkCaptureCondition(at index: Int) -> Bool {
        if isEmpty(at: index) {
            return true
        }
        return false
    }
    
    func capture(from index: Int) -> Int {
        var totalShellsCaptured: Int = 0
        let opposite: Int = oppIndex(of: index)
        totalShellsCaptured = totalShellsCaptured + self.board[index] + self.board[opposite]
        return totalShellsCaptured
    }
    
    func player1Empty() -> Bool {
        var sum = 0
        for i in 0...6 {
            sum = sum + self.board[i]
        }
        if (sum == 0) {
            return true
        }
        else {
            return false
        }
    }
    
    func player2Empty() -> Bool {
        var sum = 0
        for i in stride(from: 13, to: 6, by: -1) {
            sum = sum + self.board[i]
        }
        if(sum == 0) {
            return true
        }
        return false
    }

}
