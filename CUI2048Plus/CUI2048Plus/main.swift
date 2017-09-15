//
//  main.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/13.
//  © 2017 Julia
//

import Foundation

let MAX_DIGITS = 5
let SIDE_LENGTH = 4
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
       print("Please enter 1, 2, 3 or 4.")
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
        print("+-------------------------------+\n|       |       |       |       |")
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
        print("|\n|       |       |       |       |")
    }
    print("+-------------------------------+")
}


print("\n=============================")
print("      Welcome to 2048+       ")
print("=============================")

var goal:Int = 0
while (goal == 0) {
    print("Select a mode number:  1: EASY  2: NORMAL  3: HARD  4: EXPERT")
    var input = readLine()!
    goal = selectMode(mode: &input)
}

generateNewNumber()

var onGame: Bool = true

while (onGame) {

    generateNewNumber()

    displayTiles()

    print("i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | q: (QUIT)")
    var move: String = readLine()!
    
    var shift = ManageShift()

    switch(move) {
        case "i":
            print("UP(↑)")
            shift.shiftUp()
            break
        case "j":
            print("LEFT(←)")
            shift.shiftLeft(matrix: &originalMatrix)
            break
        case "k":
            print("DOWN(↓)")
            shift.shiftDown()
            break
        case "l":
            print("RIGHT(→)")
            shift.shiftRight()
            break
        case "q":
            print("QUIT")
            onGame = false
            break
        default:
            print("Oops! Please enter again.")
    }
}

print("GAME OVER")
