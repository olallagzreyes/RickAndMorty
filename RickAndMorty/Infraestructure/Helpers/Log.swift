//
//  Log.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

class Log {
    
    static func d(tag: String, message: String, newLine: Bool = false) {
        print("[" + tag + "] => " + message)
        if newLine { print() }
    }
    
    static func e(message: String, newLine: Bool = false) {
        Log.d(tag: "ERROR", message: message, newLine: newLine)
    }
    
    static func e(tag: String, message: String, newLine: Bool = false) {
        Log.d(tag: "ERROR - \(tag)", message: message, newLine: newLine)
    }
    
    static func s(message: String, newLine: Bool = false) {
        Log.d(tag: "SUCCESS", message: message, newLine: newLine)
    }
    
    static func s(tag: String, message: String, newLine: Bool = false) {
        Log.d(tag: "SUCCESS - \(tag)", message: message, newLine: newLine)
    }
    
    static func i(message: String, newLine: Bool = false) {
        Log.d(tag: "INFO", message: message, newLine: newLine)
    }
    
    static func i(tag: String, message: String, newLine: Bool = false) {
        Log.d(tag: "INFO - \(tag)", message: message, newLine: newLine)
    }

    static func event(tag: String, message: String, newLine: Bool = false) {
        Log.d(tag: "EVENT - \(tag)", message: message, newLine: newLine)
    }
}
