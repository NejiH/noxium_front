//
//  ToDate.swift
//  NoxiumFront
//
//  Created by Lucie Grunenberger  on 01/10/2025.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy/MM/dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
}
