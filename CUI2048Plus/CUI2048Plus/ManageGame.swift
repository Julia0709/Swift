//
//  ManageGame.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/14.
//  © 2017 Julia
//

import Foundation

class ManageShift {
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
}
