//
//  String+DateFormat.swift
//  CleanArchitecture
//
//  Created by Mason Kim on 1/17/24.
//

import Foundation

extension String {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    func date() -> Date {
        Self.formatter.date(from: self) ?? Date()
    }
}

extension Date {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        return formatter
    }()

    func string() -> String {
        Self.formatter.string(from: self)
    }
}
