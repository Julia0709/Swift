//
//  ManageOutput.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/14.
//  © 2017 Julia
//

import Foundation

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
