//
//  masmenosObjetos.swift
//  Carrito
//
//  Created by user on 05/08/19.
//  Copyright © 2019 Lòpez Estrada Arturo. All rights reserved.
//

import Foundation
import UIKit
class masmenosObjetos: UIButton{
    var color: UIColor = .blue
    override func awakeFromNib() {
        backgroundColor = .gray
        setTitleColor(.white, for: .normal)
    }
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 3
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 10, y:center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 10, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: nil)
    }
}

