//
//  GradientColorModel.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 29.04.2021.
//

import Foundation

// MARK: - GradientModelElement
struct GradientModelElement: Codable {
    let groupName: String
    let groupColors: [GradientColors]
}

// MARK: - Color
struct GradientColors: Codable {
    let name: String
    let colors: [String]
}

typealias GradientModel = [GradientModelElement]
