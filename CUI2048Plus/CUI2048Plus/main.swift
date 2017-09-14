//
//  main.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/13.
//  © 2017 Julia
//

import Foundation

var matrix: [[Int]] = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

func generateNewNumber() {
    var emptyTiles = [[Int]]()
    for (x, row) in matrix.enumerated() {
        for (y, n) in row.enumerated() {
            if (n == 0) {
                emptyTiles.append([x, y])
            }
        }
    }
    let randomIndex = Int(arc4random_uniform(UInt32(emptyTiles.count)))
    let t = emptyTiles[randomIndex]
    matrix[t[0]][t[1]] = 2
    
}

print("Welcome to 2048+!")

generateNewNumber()

while (true) {

    generateNewNumber()
    print(matrix)

    print("i(↑)  j(←)  k(↓)  l(→) | p(pose)")
    var move: String = readLine()!

    switch(move) {
        case "i":
            // shiftUp()
            break
        case "j":
            // shiftLeft()
            break
        case "k":
            // shiftDown()
        break
        case "l":
            // shiftRight()
            break
        case "p":
            break
        default:
            print("Enter again:\ni(↑)  j(←)  k(↓)  l(→) | p(pose)")
    }
}
