//
//  ViewController.swift
//  LightIB
//
//  Created by Никита Раташнюк on 03.09.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var isFlashlightOn: Bool = false
    var colors: [UIColor] = [.red, .yellow, .green]
    var colorCounter = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFlashlightOn.toggle()
        colorCounter += 1
        toggleTorch(on: isFlashlightOn)
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = colors[colorCounter % colors.count]
    }
    
    func toggleTorch(on: Bool) {
        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    }
}

