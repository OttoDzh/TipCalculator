//
//  MainView.swift
//  TipCalculator
//
//  Created by Otto Dzhandzhuliya on 23.02.2023.
//

import UIKit

class MainView: UIView {
    
    let appLabel = UILabel(text: "Tip Calculator", font: ODFonts.titleLabelFont)
    let bilLabel = UILabel(text: "Bill Total:", font: ODFonts.avenirFont)
    let bilTf = UITextField(placeholder: "Amount")
    let percentageLabel = UILabel(text: "Tax Percentage", font: ODFonts.avenirFont)
    let slider = UISlider()
    let spliLabel = UILabel(text: "Split", font: ODFonts.avenirFont)
    let spliSlider = UISlider()
    let resultLabel = UILabel(text: "", font: ODFonts.avenirFont)
    
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = .black
        appLabel.textColor = .white
        bilLabel.textColor = .white
        bilTf.backgroundColor = .white
        bilTf.borderStyle = .line
        bilTf.tintColor = .systemBlue
        bilTf.layer.cornerRadius = 12
        bilTf.textColor = .black
        bilTf.borderStyle = .none
        slider.thumbTintColor = .white
        slider.minimumValue = 1
        slider.maximumValue = 100
        spliSlider.maximumValue = 10
        spliSlider.minimumValue = 1
        spliLabel.textColor = .white
        percentageLabel.textColor = .white
        resultLabel.textColor = .white
    }
    
    func setupConstraints() {
        let billStack = UIStackView(arrangedSubviews: [bilLabel,bilTf], axis: .horizontal, spacing: 12)
        let percentStack = UIStackView(arrangedSubviews: [percentageLabel,slider], axis: .horizontal, spacing: 12)
        let spliStack = UIStackView(arrangedSubviews: [spliLabel,spliSlider], axis: .horizontal, spacing: 12)
        
        addSubview(appLabel)
        addSubview(billStack)
        addSubview(percentStack)
        addSubview(resultLabel)
        addSubview(spliStack)
  
        Helper.tamicOff(views: [appLabel,billStack,percentStack,resultLabel,spliStack])
        
        NSLayoutConstraint.activate([appLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     appLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
                                     billStack.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 36),
                                     billStack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     bilTf.widthAnchor.constraint(equalToConstant: 240),
                                     percentStack.topAnchor.constraint(equalTo: billStack.bottomAnchor, constant: 12),
                                     percentStack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     slider.widthAnchor.constraint(equalToConstant: 240),
                                     spliStack.topAnchor.constraint(equalTo: percentStack.bottomAnchor, constant: 12),
                                     spliStack.leadingAnchor.constraint(equalTo: percentStack.leadingAnchor),
                                     spliSlider.widthAnchor.constraint(equalToConstant: 240),
                                     spliSlider.leadingAnchor.constraint(equalTo: slider.leadingAnchor),
                                     billStack.widthAnchor.constraint(equalTo: percentStack.widthAnchor),
                                     bilTf.heightAnchor.constraint(equalToConstant: 40),
                                     resultLabel.topAnchor.constraint(equalTo: spliStack.bottomAnchor, constant: 48),
                                     resultLabel.leadingAnchor.constraint(equalTo: billStack.leadingAnchor)])
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    


}
