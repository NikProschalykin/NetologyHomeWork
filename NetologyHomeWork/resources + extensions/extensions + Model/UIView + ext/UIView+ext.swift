//
//  UIView+ext.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 14.04.2023.
//

import UIKit


extension UIView {

    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
    addSubview(separator)
    }
}

// MARK: - Присвоение идентификатора к UIView

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}


// MARK: - Тряска View (влево-вправо)
extension UIView {
    func shake(){
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 3
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
            self.layer.add(animation, forKey: "position")
        }
}

