//
//  CategoryModel.swift
//  ThemealDb_Swiftui
//
//  Created by mahesh lad on 29/11/2023.
//

import Foundation

// MARK: - CategoryResponse
struct CategoryResponse: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable, Identifiable {
    let id = UUID()
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    
    enum CodingKeys: String, CodingKey {
        case idCategory
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
}
