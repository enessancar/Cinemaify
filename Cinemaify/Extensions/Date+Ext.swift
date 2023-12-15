//
//  Date+Ext.swift
//  Cinemaify
//
//  Created by Enes Sancar on 15.12.2023.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.day().month().year())
    }
}
