//
//  BasicColorModel.swift
//  ColorsApp
//
//  Created by Mahmut MERCAN on 29.04.2021.
//

import Foundation

// MARK: - BasicColorElement
struct BasicColorElement: Codable {
    let name: String
    let colors: [Color]
}

// MARK: - Color
struct Color: Codable {
    let name, color: String
}

typealias BasicColor = [BasicColorElement]
