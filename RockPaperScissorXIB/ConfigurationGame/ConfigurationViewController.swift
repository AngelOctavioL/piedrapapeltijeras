//
//  ConfigurationViewController.swift
//  RockPaperScissorXIB
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

class ConfigurationViewController: UIViewController {
    //@IBOutlet weak var selectTypeGameRoundsButton: UIButton!
    //@IBOutlet weak var selectTypeGamePointsButton: UIButton!
    @IBOutlet weak var selectTypeGameRoundView: UIView!
    @IBOutlet weak var selectTypeGamePointsView: UIView!
    @IBOutlet weak var setSliderValue: UISlider!
    @IBOutlet weak var setValueSliderInLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliderValue.maximumValue = 5
        setSliderValue.value = 0
        
        setSliderValue.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        setValueSliderInLabel.text = "\(Int(setSliderValue.value))"
    }
    
    @IBAction func renderTypeGame(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    print("Rounds")
                    selectTypeGameRoundView.isHidden = false
                    selectTypeGamePointsView.isHidden = true
                case 1:
                    print("Points")
                    selectTypeGameRoundView.isHidden = true
                    selectTypeGamePointsView.isHidden = false
                default:
                    break
                }
    }
    
    // Función que se llama cuando cambia el valor del slider
    @objc func sliderValueChanged(_ sender: UISlider) {
        // Actualizar el texto del label con el nuevo valor del slider
        setValueSliderInLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func startGameSelected() {
        print("game selected!")
        let startViewController = StartViewController()
        //navigationController?.pushViewController(startViewController, animated: true)
        present(startViewController, animated: true)
    }
    
    @IBAction func nextInformationView() {
        print("next information")
        let informationViewController = InformationViewController(nibName: "InformationViewController", bundle: nil)
        present(informationViewController, animated: true)
        
    }
}
