//
//  exprparser.swift
//  lihmalang
//
//  Created by Oleksander Krainiak on 16.11.2024.
//

import Foundation

struct lihmaVar {
    var name: String
    var value: String
    var type: LihmaType
    
    private static func getType(_ value: String) -> LihmaType {
        if value.hasPrefix("\"") && value.hasSuffix("\"") {
            return .string
        } else if value.matches("^[\\-0-9.]+$") {
            return .int
        } else {
            return .unknown
        }
    }
    
    static func stringToVarAssignment(_ varString: String) -> Self {
        let parsedValues = varString.split(separator: "=").map {$0.trimmingCharacters(in: .whitespaces)}
        
        let parsedType = self.getType(parsedValues[1])
        
        let parsedVar = Self(name: parsedValues[0], value: parsedValues[1], type: parsedType)
        
        
        return parsedVar
    }
}


class ExprParser {
    var varContext: Array<lihmaVar>
    init(varContext: Array<lihmaVar>) {
        self.varContext = varContext
    }
    
    func eval() {
        
    }
}
