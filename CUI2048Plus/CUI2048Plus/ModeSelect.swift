//
//  ModeSelect.swift
//  CUI2048Plus
//
//  Created by Julia on 2017/09/14.
//  © 2017 Julia
//

import Foundation

// Select mode
func selectMode(mode: inout String) -> Int {
    var goal = 0
    
    switch (mode) {
    case "1":
        mode = "EASY"
        goal = 256
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

func inputMode() -> Int {
    var g:Int = 0
    while (g == 0) {
        print("Select a mode number:  \n1: EASY  2: NORMAL  3: HARD  4: EXPERT")
        var input = readLine()!
        g = selectMode(mode: &input)
    }
    return g;
}
