//
//   Model.swift
//  Days without sugar
//
//  Created by Bekpayev Dias on 27.07.2023.
//

import Foundation

struct CalculatorModel {
    func numberOfDays(from startDate: Date, to endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day ?? 0
    }
}

