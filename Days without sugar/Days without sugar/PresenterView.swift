//
//  PresenterView.swift
//  Days without sugar
//
//  Created by Bekpayev Dias on 27.07.2023.
//

import Foundation

protocol PresenterProtocol {
    var view: ViewControllerProtocol? { get set } 
    func numberOfDaysButtonTap (startDate: Date)
}

class Presenter: PresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    
    let model = CalculatorModel()
    
    func numberOfDaysButtonTap(startDate: Date) {
        let endDate = Date()
        let days = model.numberOfDays(from: startDate, to: endDate)
        view?.showNumberOfDays(days: days)
    }
}
