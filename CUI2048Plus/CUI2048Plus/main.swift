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
var originalMatrix: [[Int]] = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
var score = 0



print("\n=================================")
print("        Welcome to 2048+         ")
print("=================================")

var goal:Int = inputMode()

generateNewNumber()
var onGame: Bool = true
while (onGame) {
    print("GOAL: \(goal)  SCORE: \(score)")
    generateNewNumber()
    displayTiles()
    onGame = nextMove(onGame: &onGame)
}

print("=================================")
print("GAME OVER")
print("SCORE: \(score)")
