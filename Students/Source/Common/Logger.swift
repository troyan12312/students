//
//  Logger.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

final class Logger {
    enum LogType: String {
        case debug = "🔹DEBUG: "
        case info = "✅INFO: "
        case warning = "⚠️WARNING: "
        case error = "🆘ERROR: "
        
        var shouldAppendNewLine: Bool {
            switch self {
            case .error: return true
            default: return false
            }
        }
    }
    
    class func debug(_ msg: String?,
                     _ file: String = #file,
                     _ function: String = #function,
                     _ line: Int = #line) {
        log(message: msg ?? "", withType: LogType.debug, fileName: file, functionName: function, line: line)
    }
    
    class func info(_ msg: String,
                    _ file: String = #file,
                    _ function: String = #function,
                    _ line: Int = #line) {
        log(message: msg, withType: LogType.info,  fileName: file, functionName: function, line: line)
    }
    
    class func warning(_ msg: String,
                       _ file: String = #file,
                       _ function: String = #function,
                       _ line: Int = #line) {
        log(message: msg, withType: LogType.warning, fileName: file, functionName: function, line: line)
    }
    
    class func error(_ msg: String,
                     _ file: String = #file,
                     _ function: String = #function,
                     _ line: Int = #line) {
        log(message: msg, withType: LogType.error, fileName: file, functionName: function, line: line)
    }
    
    private static func log(message: String,
                            withType type: LogType,
                            fileName: String,
                            functionName: String,
                            line: Int) {
        let filename = fileName.asNSString.lastPathComponent.asNSString.deletingPathExtension
        let fileExtension = fileName.asNSString.lastPathComponent.asNSString.pathExtension
        
        var information = "\(type.rawValue) \(filename).\(fileExtension): \(line) \(functionName): \(message)"
        
        if type.shouldAppendNewLine {
            information.append("\n")
        }
        #if DEBUG
        print(information)
        #endif
    }
}
