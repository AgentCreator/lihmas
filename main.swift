//
//  main.swift
//  lihmalang
//
//  Created by Oleksander Krainiak on 16.11.2024.
//

import Foundation

let file = "/Users/oleksanderkrainiak/Desktop/xcode/lihmalang/lihmalang/lihmaTest.lihma"

let s = try! String(contentsOfFile: file, encoding: .utf8)
//print(s)

let parser = varParser()

for line in s.split(separator: "\n") {
    parser.addVar(String(line))
}

print(parser.console().value, type(of: parser.console().value))
print(parser.console().type.getClass())
