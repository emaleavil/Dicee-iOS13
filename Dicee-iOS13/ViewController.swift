//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let diceImages = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]

    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func roll(_ sender: UIButton) {
        leftDice.animate(with: diceImages)
        rightDice.animate(with: diceImages)
    }
}

extension UIImageView {
    func animate(
        with images: [UIImage],
        duration: TimeInterval = 1,
        repeatCount: Int = 2
    ) {
        self.animationImages = images
        self.animationDuration = duration
        self.animationRepeatCount = repeatCount
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.image = images.randomElement()
        }
    }
}

