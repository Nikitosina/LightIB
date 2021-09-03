//
//  ViewController.swift
//  LightIB
//
//  Created by Никита Раташнюк on 03.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateUI()
        print(#line, #function)
    }
    
    func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
}

