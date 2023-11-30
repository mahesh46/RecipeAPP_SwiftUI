//
//  CategoryViewModel.swift
//  ThemealDb_Swiftui
//
//  Created by mahesh lad on 29/11/2023.
//


import Foundation

@MainActor
class CatgetoryViewModel: ObservableObject{
    
    @Published var categories : [Category] = []
    @Published var hasError = false
    
    func getCategories() async throws {
        
        guard let data =  try? await NetworkService().fetchData() else {
            self.categories = []
            self.hasError = true
            throw NetworkError.badData
        }
    
        self.categories = data
        
    }
    
}
