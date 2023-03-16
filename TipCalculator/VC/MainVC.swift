//
//  ViewController.swift
//  TipCalculator
//
//  Created by Otto Dzhandzhuliya on 23.02.2023.
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.bilTf.delegate = self
        addTargets()
    }

    func addTargets() {
        mainView.slider.addTarget(self, action: #selector(getPercent), for: .touchUpInside)
        mainView.spliSlider.addTarget(self, action: #selector(getSplit), for: .touchUpInside)
    }
    
    @objc func getSplit() {
        mainView.spliLabel.text = "Split \(Int(mainView.spliSlider.value))"
        getTip()
    }
    
    @objc func getPercent() {
        mainView.percentageLabel.text = "Tax Percentage \(Int(mainView.slider.value)) %"
        getTip()
        
    }
    
     func getTip() {
        let doubleBill = Double(mainView.bilTf.text!) ?? 0
        let splitValue = Int(mainView.spliSlider.value)
        let tipMary = (Int(doubleBill) / 100) * Int(mainView.slider.value)
        let tipM = tipMary / splitValue
        mainView.resultLabel.text = "Each tip \(tipM)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:".0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

