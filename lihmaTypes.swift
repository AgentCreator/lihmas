//
//  lihmaTypes.swift
//  lihmalang
//
//  Created by Oleksander Krainiak on 16.11.2024.
//

import Foundation

enum LihmaType {
    case string
    case int
    case list
    case function
    case unknown
    case bool
    
    func getClass() -> any LihmaObject.Type {
        switch self {
        case .int:
            return LihmaInt.self
        case .string:
            return LihmaString.self
        default:
            return LihmaNull.self
        }
    }
}

protocol LihmaObject {
//    var value: Any {get set}
    func getValue() -> Any
    func __add__(_ other: Self) -> Self
    func __sub__(_ other: Self) -> Self
    func __mul__(_ other: Self) -> Self
    func __div__(_ other: Self) -> Self
}

extension LihmaObject {
    func __add__(_ other: Self) -> Self {
        return other
    }
    func __sub__(_ other: Self) -> Self {
        return other
    }
    func __mul__(_ other: Self) -> Self {
        return other
    }
    func __div__(_ other: Self) -> Self {
        return other
    }
}

class LihmaString: LihmaObject {
    var value: String
    required init(_ value: String) {
        self.value = value
    }
    func getValue() -> Any {
        return value
    }
    func __add__(_ other: LihmaString) -> Self {
        return Self(value + other.value)
    }
    
}


class LihmaInt: LihmaObject {
    var value: Int
    required init(_ value: Int) {
        self.value = value
    }
    func getValue() -> Any {
        return value
    }
    func __add__(_ other: LihmaInt) -> Self {
        return Self(value + other.value)
    }
    
}

class LihmaNull: LihmaObject {
    var value: Int
    required init() {
        self.value = 0
    }
    func getValue() -> Any {
        return value
    }
    func __add__(_ other: any LihmaObject) -> Self {
        return Self()
    }
    
}
