//
//  main.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/13.
//  © 2017 Julia
//

import Foundation

let MAX_DIGITS = 4
let length = 4
var time = 0;
var originalMatrix: [[Int]] = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

// Select mode
func selectMode(mode: inout String) -> Int {
    var goal = 0
    
    switch (mode) {
    case "1":
        mode = "EASY"
        goal = 512
        break
    case "2":
        mode = "NORMAL"
        goal = 2048
        break
    case "3":
        mode = "HARD"
        goal = 4092
        break
    case "4":
        mode = "EXPERT"
        goal = 8192
        break
    default:
       print("Please type 1, 2, 3 or 4: ")
        return goal
    }
    print(mode + " MODE: GAME START!");
    return goal;
}

// Generate and add a new '2' tile
func generateNewNumber() {
    var emptyTiles = [[Int]]()
    for (y, row) in originalMatrix.enumerated() {
        for (x, n) in row.enumerated() {
            if (n == 0) {
                emptyTiles.append([y, x])
            }
        }
    }
    if (emptyTiles.count > 0) {
        let randomIndex = Int(arc4random_uniform(UInt32(emptyTiles.count)))
        let t = emptyTiles[randomIndex]
        originalMatrix[t[0]][t[1]] = 2
    } else {
        print("Can't move.")
    }
}

// Format and print matrix
func displayTiles() {
    for y in 0..<originalMatrix.count {
        let row = originalMatrix[y]
        print("+---------------------------+\n|      |      |      |      |")
        for x in 0..<row.count {
            var s = String(row[x])
            let l = MAX_DIGITS - s.characters.count
            if (l > 0) {
                for _ in 0...l - 1 {
                    s = " " + s
                }
            }
            print("| \(s) ", terminator:"")
        }
        print("|\n|      |      |      |      |")
    }
    print("+---------------------------+")
}

// Rotate matrix clockwise
func rotate(matrix: inout [[Int]], times: inout Int) -> [[Int]] {
    while (times > 0) {
        var rotatedMatrix = Array(repeating: Array(repeating: 0, count: length), count: length)
        for y in 0..<matrix.count {
            let l = matrix[y].count
            for x in 0..<l {
                rotatedMatrix[y][x] = matrix[l - x - 1][y]
            }
        }
        matrix = rotatedMatrix
        times -= 1
    }
    return matrix
}

// Shift left
func shiftLeft(matrix: inout [[Int]]) -> [[Int]] {
    for y in 0..<matrix.count {
        let row = matrix[y]
        for x1 in 0..<row.count-1 {
            let n1 = matrix[y][x1]
            if (n1 == 0) {
                continue
            }
            for x2 in x1+1..<row.count {
                let n2 = matrix[y][x2]
                if (n2 == 0) {
                    continue
                }
                if (n1 != n2) {
                    break
                }
                matrix[y][x1] = n1 + n2
                matrix[y][x2] = 0
                break
            }
        }

        var positions = [Int]()
        for x in 0..<row.count {
            let n = row[x]
            if (n == 0) {
                positions.append(x)
                continue
            }
            if (positions.count > 0) {
                matrix[y][positions[0]] = n
                matrix[y][x] = 0
                positions.remove(at: 0)
                positions.append(x)
            }
        }
    }
    return matrix
}

// Shift up
func shiftUp() {
    // Rotate 270˚ clockwise
    time = 3
    rotate(matrix: &originalMatrix, times: &time)

    // Shift tiles
    shiftLeft(matrix: &originalMatrix)
    
    // Rotate 90˚ clockwise
    time = 1
    rotate(matrix: &originalMatrix, times: &time)
}

// Shift down
func shiftDown() {
    // Rotate 90˚ clockwise
    time = 1
    rotate(matrix: &originalMatrix, times: &time)


    // Shift tiles
    shiftLeft(matrix: &originalMatrix)
    
    // Rotate 270˚ clockwise
    time = 3
    rotate(matrix: &originalMatrix, times: &time)
}

// Shift right
func shiftRight() {
    // Rotate 180˚ clockwise
    time = 2
    rotate(matrix: &originalMatrix, times: &time)
    
    
    // Shift tiles
    shiftLeft(matrix: &originalMatrix)
    
    // Rotate 180˚ clockwise
    time = 2
    rotate(matrix: &originalMatrix, times: &time)
}

print("\n=============================")
print("      Welcome to 2048+       ")
print("============================")

var goal:Int = 0
while (goal == 0) {
    print("Select a mode number:  1: EASY  2: NORMAL  3: HARD  4: EXPERT")
    var input = readLine()!
    goal = selectMode(mode: &input)
}

generateNewNumber()

while (true) {

    generateNewNumber()

    displayTiles()

    print("i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | r(RESET)")
    var move: String = readLine()!

    switch(move) {
        case "i":
            print("UP(↑)")
            shiftUp()
            break
        case "j":
            print("LEFT(←)")
            shiftLeft(matrix: &originalMatrix)
            break
        case "k":
            print("DOWN(↓)")
            shiftDown()
            break
        case "l":
            print("RIGHT(→)")
            shiftRight()
            break
        case "r":
            print("RESET")
            break
        default:
            print("Enter again:\ni(↑)  j(←)  k(↓)  l(→) | p(pose)")
    }
}
