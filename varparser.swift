//
//  varparser.swift
//  lihmalang
//
//  Created by Oleksander Krainiak on 16.11.2024.
//

import Foundation

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}



class varParser {
    var vars: Array<lihmaVar> = [
        lihmaVar(name: "console", value: "", type: .string)
    ]
    
    func console() -> lihmaVar {
        return vars.first(where: {$0.name == "console"})!
    }
    
    func getVarNames() -> Array<String> {
        return vars.map { $0.name }
    }
    
    func addVar(_ newValue: String) -> Void {

        var newParsedVar = lihmaVar.stringToVarAssignment(newValue)
        if newParsedVar.type == .unknown && getVarNames().contains(newParsedVar.name) {
//            print("refref!")
            let ref = vars[vars.firstIndex(where: {$0.name == newParsedVar.value})!]
//            print(ref)
            newParsedVar.value = ref.value
//            print(newParsedVar)
            newParsedVar.type = ref.type
        }
//        if vars.filter({$0.name == newParsedVar.name}).isEmpty {
//            vars.append(lihmaVar.stringToVarAssignment(newValue))
//        } else {
//            let same = vars.filter({$0.name != newParsedVar.name}).first!
//            print(same, vars[vars.firstIndex(where: {$0.name == same.name})!], "")
//        }
//        print(vars.first(where: {$0.name == newParsedVar.name}))
        if vars.first(where: {$0.name == newParsedVar.name}) == nil {
            vars.append(newParsedVar)
        } else {
            vars[vars.firstIndex(where: {$0.name == newParsedVar.name})!] = newParsedVar
        }

    }
    
}
