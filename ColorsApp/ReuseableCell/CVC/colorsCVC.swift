//
//  colorsCVC.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 25.04.2021.
//

import UIKit

class colorsCVC: UICollectionViewCell {

    var gradient: CAGradientLayer?
    var result: GradientModelElement?
    

    static let identifier = "colorsCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradient?.frame = self.layer.bounds
        
    }
    
    func setupGradient(colors: [String]){
        var cgColors: [CGColor] = []
        for i in colors {
            let newColor = UIColor(hex: i)
            cgColors.append(newColor!.cgColor)
        }
        gradient?.removeFromSuperlayer()
        gradient = CAGradientLayer()
        guard let gradient = gradient else { return }
        gradient.frame = self.layer.bounds
        gradient.colors = cgColors
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    

    static func nib() -> UINib {
        return UINib(nibName: "colorsCVC", bundle: nil)
    }

}



//extension UIColor {
//    convenience init(rgb: UInt) {
//       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
//    }
//}
