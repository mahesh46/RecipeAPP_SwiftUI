//
//  NetworkService.swift
//  ThemealDb_Swiftui
//
//  Created by mahesh lad on 29/11/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badData
}

class NetworkService {
    
    func fetchData() async throws -> [Category] {
        
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            print("This URL is not working!")
            throw NetworkError.badURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(CategoryResponse.self, from: data) {
                // print(decodedResponse)
                return decodedResponse.categories
            }
        } catch {
            print("The data is not valid")
            throw NetworkError.badData
        }
        return [Category]()
    }
}
