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
    for (y, row) in matrix.enumerated() {
        for (x, n) in row.enumerated() {
            if (n == 0) {
                emptyTiles.append([y, x])
            }
        }
    }
    let randomIndex = Int(arc4random_uniform(UInt32(emptyTiles.count)))
    let t = emptyTiles[randomIndex]
    matrix[t[0]][t[1]] = 2
}

func displayTiles() {
    for y in 0..<matrix.count {
        let row = matrix[y]
        for x in 0..<row.count {
//            let s = String(format: "%04d", n)
            let s = row[x]
            print(" \(s) ", terminator:"")
        }
        print("\n")
    }
}

func shiftLeft() {
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
                print(positions[0])
                matrix[y][positions[0]] = n
                matrix[y][x] = 0
                positions.remove(at: 0)
                positions.append(x)
            }
        }
    }
}

print("Welcome to 2048+!\n")

generateNewNumber()

while (true) {

    generateNewNumber()

    displayTiles()

    print("i(↑)  j(←)  k(↓)  l(→) | p(pose)")
    var move: String = readLine()!

    switch(move) {
        case "i":
            // shiftUp()
            break
        case "j":
            shiftLeft()
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
