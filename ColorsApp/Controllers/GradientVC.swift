//
//  GradientVC.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 29.04.2021.
//

import UIKit

class GradientVC: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    var gradient: CAGradientLayer?
    var result: [GradientModelElement] = []
    var selectedColors: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientColorParseJSON()
        setupGradient(colors: selectedColors)

        // Do any additional setup after loading the view.
    }
    
    func setupGradient(colors: [String]) {
        var cgColors: [CGColor] = []
        for i in colors {
            let newColor = UIColor(hex: i)
            cgColors.append(newColor!.cgColor)
        }
        gradient = CAGradientLayer()
        guard let gradient = gradient else { return }
        gradient.frame = gradientView.bounds
        gradient.colors = cgColors
        gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func gradientColorParseJSON() {
        guard let path = Bundle.main.path(forResource: "gradientColor", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([GradientModelElement].self, from: jsonData)
            return
            
        } catch {
            print("Error: \(error)")
        }
    }
}
