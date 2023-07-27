//
//  ViewController.swift
//  Days without sugar
//
//  Created by Bekpayev Dias on 27.07.2023.
//

import UIKit
import SnapKit

protocol ViewControllerProtocol: AnyObject {
    func showNumberOfDays(days: Int)
}

class ViewController: UIViewController, ViewControllerProtocol {
    var presenter: PresenterProtocol!
    let image = UIImage(named: "Image")
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите дату начала отсчета ↓"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let taskLabel2: UILabel = {
        let label = UILabel()
        label.text = "ДЕНЬ без сахара, Вы молодец!!!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let dataPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        return picker
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0,"
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 100.0)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
        presenter = Presenter()
        presenter.view = self
        if let savedDays = UserDefaults.standard.value(forKey: "numberOfDays") as? Int {
            resultLabel.text = "\(savedDays),"
        }
    }
    func showNumberOfDays(days: Int) {
        resultLabel.text = "\(days),"
        UserDefaults.standard.set(days, forKey: "numberOfDays")
    }
    
    @objc func PickerValueChanged() {
        let startDate = dataPicker.date
        presenter.numberOfDaysButtonTap(startDate: startDate)
    }
}

private extension ViewController {
    func setupScene() {
        view.backgroundColor = UIColor(patternImage: image!)
        view.addSubview(dataPicker)
        view.addSubview(resultLabel)
        view.addSubview(taskLabel)
        view.addSubview(taskLabel2)
        dataPicker.addTarget(self, action: #selector(PickerValueChanged), for: .valueChanged)
        
    }
    
    func makeConstraints() {
        resultLabel.snp.makeConstraints() {
            $0.right.left.equalToSuperview().inset(25)
            $0.top.equalTo(dataPicker.snp.bottom).offset(100)
        }
        
        dataPicker.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(250)
            $0.left.equalToSuperview().inset(125)
        }
        
        taskLabel.snp.makeConstraints() {
            $0.right.left.equalToSuperview().inset(25)
            $0.bottom.equalTo(dataPicker.snp.top).inset(-50)
        }
        
        taskLabel2.snp.makeConstraints() {
            $0.right.left.equalToSuperview().inset(25)
            $0.top.equalTo(resultLabel.snp.bottom).offset(60)
        }
    }
}
