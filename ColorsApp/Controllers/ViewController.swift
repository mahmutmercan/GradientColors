//
//  ViewController.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 22.04.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var editorView: UIView!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    var gradient: CAGradientLayer?

    var result: [GradientModelElement] = []
    var result2: [BasicColorElement] = []
    var gradientList: [GradientColors] = []
    var selectedColors: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorsCollectionView.register(colorsCVC.nib(), forCellWithReuseIdentifier: colorsCVC.identifier)
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
        
        gradientColorParseJSON()
        basicColorParseJSON()
        setupGradientList()
    }
    
    func setupGradientList() {
        for i in result {
            gradientList.append(contentsOf: i.groupColors)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        selectedColors = gradientList[indexPath.row].colors
        performSegue(withIdentifier: "toGradientVC", sender: nil)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gradientList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorsCVC.identifier, for: indexPath) as! colorsCVC
        cell.setupGradient(colors: gradientList[indexPath.row].colors)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let vc = segue.destination as? GradientVC{
        vc.selectedColors = self.selectedColors
      }
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
    
    private func basicColorParseJSON() {
    guard let path2 = Bundle.main.path(forResource: "basicColors", ofType: "json") else {
    return
    }
    let url = URL(fileURLWithPath: path2)
    
    do {
    let jsonData = try Data(contentsOf: url)
    result2 = try JSONDecoder().decode([BasicColorElement].self, from: jsonData)
    return
        
    } catch {
    print("Error")
    }
    }
}

extension UIColor {
    convenience init(rgb: UInt) {
       self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
}
