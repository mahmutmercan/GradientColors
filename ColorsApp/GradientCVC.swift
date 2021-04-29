//
//  GradientCVC.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 22.04.2021.
//

import UIKit

class GradientCVC: UICollectionViewCell {

    static let identifier: String = "GradientCVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }



}
