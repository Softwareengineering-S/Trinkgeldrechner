//
//  ViewController.swift
//  Trinkgeldrechner
//
//  Created by Monique Shaqiri on 05.05.21.
//  Copyright © 2021 Monique Shaqiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eingabeBetragTextfield: UITextField!
    @IBOutlet weak var prozentLabel: UILabel!
    @IBOutlet weak var prozentSliderOutlet: UISlider!
    @IBOutlet weak var trinkgeldBetragLabel: UILabel!
    @IBOutlet weak var gesamtkostenBetragLabel: UILabel!
    var essensKosten = 0.0
    var trinkgeldProzent = 0.0
    var kostenTrinkgeld = 0.0
    var gesamtKosten = 0.0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prozentSliderOutlet.value = 0.0
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func prozentSliderAction(_ sender: UISlider) {
        
        print("Slidertest")
        ausrechnenDerKosten()
    }
    func ausrechnenDerKosten(){
        if eingabeBetragTextfield.text != "" {
            essensKosten = Double(eingabeBetragTextfield.text!)!
            trinkgeldProzent = Double(prozentSliderOutlet.value)
            kostenTrinkgeld = (essensKosten * trinkgeldProzent) / 100
            gesamtKosten = essensKosten + kostenTrinkgeld
            print("Trinkgeld\(kostenTrinkgeld) und GesamtKosten \(gesamtKosten)")
            printUIElements()
        }
    }
    
    func printUIElements() {
        let stringProzent = String(format: "%.0f", trinkgeldProzent)
        let stringTrinkgeld = String(format: "%.2f", kostenTrinkgeld)
        let stringGesamtKosten = String(format: "%.2f", gesamtKosten)
        prozentLabel.text = stringProzent + " % "
        trinkgeldBetragLabel.text = "Trinkgeld" + stringTrinkgeld + "€"
        gesamtkostenBetragLabel.text = "Gesamtkosten" + stringGesamtKosten + "€"
    }
    
    
    @IBAction func prozentButtonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "3%"{
            prozentSliderOutlet.value = 3.0
            prozentLabel.text = "3%"
            ausrechnenDerKosten()
        }else if sender.titleLabel?.text == "5%"{
            prozentSliderOutlet.value = 5.0
            prozentLabel.text = "5%"
            ausrechnenDerKosten()
    }else if sender.titleLabel?.text == "7%"{
            prozentSliderOutlet.value = 7.0
            prozentLabel.text = "7%"
            ausrechnenDerKosten()
    }else {
            prozentSliderOutlet.value = 10.0
            prozentLabel.text = "10%"
            ausrechnenDerKosten()
    }
        
    }
}

