//
//  main.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/13.
//  © 2017 Julia
//

import Foundation

print("Welcome to 2048+!")

var matrix: [[Int]] = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

for i in matrix {
        print(" \(i) ")
}

print("i(↑)  j(←)  k(↓)  l(→) | p(pose)")
var move = readLine()

switch(move) {
    case "i"?:
        // shiftUp()
        break
    case "j"?:
        // shiftLeft()
        break
    case "k"?:
        // shiftDown()
    break
    case "l"?:
        // shiftRight()
        break
    case "p"?:
        break
    default:
        print("Enter again:\ni(↑)  j(←)  k(↓)  l(→) | p(pose)")
}
