//
//  ViewController.swift
//  winecoreml
//
//  Created by Esteban Herrera on 7/15/17.
//  Copyright © 2017 Esteban Herrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var alcoholSlider: UISlider!
    @IBOutlet weak var malicAcidLabel: UILabel!
    @IBOutlet weak var malicAcidSlide: UISlider!
    @IBOutlet weak var ashLabel: UILabel!
    @IBOutlet weak var ashSlide: UISlider!
    @IBOutlet weak var alcalinityAshLabel: UILabel!
    @IBOutlet weak var alcalinityAshSlide: UISlider!
    @IBOutlet weak var magnesiumLabel: UILabel!
    @IBOutlet weak var magnesiumSlider: UISlider!
    @IBOutlet weak var totalPhenolsLabel: UILabel!
    @IBOutlet weak var totalPhenolsSlider: UISlider!
    @IBOutlet weak var regionLabel: UILabel!
    
    let model = wine()
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.setCustomSpacing(25, after: totalPhenolsSlider)
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateValues() {
        DispatchQueue.main.async {
            self.updateLabels();
            self.predictRegion();
        }
    }
    
    func updateLabels() {
        alcoholLabel.text = "Alcohol: \(numberFormatter.string(for: alcoholSlider.value) ?? "0")"
        malicAcidLabel.text = "Malic Acid: \(numberFormatter.string(for: malicAcidSlide.value) ?? "0")"
        ashLabel.text = "Ash: \(numberFormatter.string(for: ashSlide.value) ?? "0")"
        alcalinityAshLabel.text = "Alcalinity Ash: \(numberFormatter.string(for: alcalinityAshSlide.value) ?? "0")"
        magnesiumLabel.text = "Magnesium: \(numberFormatter.string(for: magnesiumSlider.value) ?? "0")"
        totalPhenolsLabel.text = "Total Phenols: \(numberFormatter.string(for: totalPhenolsSlider.value) ?? "0")"
        
    }
    
    func predictRegion() {
        if let prediction = try? model.prediction(alcohol: Double(alcoholSlider.value), malicAcid: Double(malicAcidSlide.value), ash: Double(ashSlide.value), alcalinityAsh: Double(alcalinityAshSlide.value), magnesium: Double(magnesiumSlider.value), totalPhenols: Double(totalPhenolsSlider.value)) {
            regionLabel.text = "Region \(prediction.classLabel) (\(prediction.classProbability[prediction.classLabel] ?? 0))"
        }
        
        
    }
}

