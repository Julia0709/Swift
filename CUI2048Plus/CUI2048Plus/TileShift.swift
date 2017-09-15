//
//  ManageGame.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/14.
//  © 2017 Julia
//

import Foundation

// Clockwise rotation
func rotate(times: inout Int) {
    while (times > 0) {
        var rotatedMatrix = Array(repeating: Array(repeating: 0, count: SIDE_LENGTH), count: SIDE_LENGTH)
        for y in 0..<originalMatrix.count {
            let l = originalMatrix[y].count
            for x in 0..<l {
                rotatedMatrix[y][x] = originalMatrix[l - x - 1][y]
            }
        }
        originalMatrix = rotatedMatrix
        times -= 1
    }
}

// Base shift func
func shiftLeft() {
    for y in 0..<originalMatrix.count {
        let row = originalMatrix[y]
        for x1 in 0..<row.count-1 {
            let n1 = originalMatrix[y][x1]
            if (n1 == 0) {
                continue
            }
            for x2 in x1+1..<row.count {
                let n2 = originalMatrix[y][x2]
                if (n2 == 0) {
                    continue
                }
                if (n1 != n2) {
                    break
                }
                originalMatrix[y][x1] = n1 + n2
                originalMatrix[y][x2] = 0
                break
            }
        }
        
        var positions = [Int]()
        for x in 0..<row.count {
            let n = originalMatrix[y][x]
            if (n == 0) {
                positions.append(x)
                continue
            }
            if (positions.count > 0) {
                originalMatrix[y][positions.removeFirst()] = n
                originalMatrix[y][x] = 0
                positions.append(x)
            }
        }
    }
}

// Common shift func
func shift(times: [Int]) {
    var t1 = times[0]
    rotate(times: &t1)
    
    shiftLeft()

    var t2 = times[1]
    rotate(times: &t2)
}


func nextMove(onGame: inout Bool) -> Bool {
    print("i: UP(↑)  j: LEFT(←)  k: DOWN(↓)  l: RIGHT(→) | q: (QUIT)")
    let move: String = readLine()!
    var times = [Int]()

    switch(move) {
    case "i":
        print("UP(↑)")
        times = [3, 1]
        break
    case "j":
        print("LEFT(←)")
        times = [0, 0]
        break
    case "k":
        print("DOWN(↓)")
        times = [1, 3]
        break
    case "l":
        print("RIGHT(→)")
        times = [2, 2]
        break
    case "q":
        print("QUIT")
        onGame = false
        break
    default:
        print("Oops! Please enter again.")
    }
    
    if (times.count == 2) {
        shift(times: times)
    }
    return onGame;
}
