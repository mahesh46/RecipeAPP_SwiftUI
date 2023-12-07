//
//  CategoryDetailView.swift
//  ThemealDb_Swiftui
//
//  Created by mahesh lad on 07/12/2023.
//

import SwiftUI

struct CategoryDetailView: View {
    var cat: Category
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center, spacing: 20){
                Text(cat.strCategory)
                    .font(.headline)
                AsyncImage(url: URL(string: cat.strCategoryThumb)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                           // .frame(maxWidth: 300, maxHeight: 100)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        // Since the AsyncImagePhase enum isn't frozen,
                        // we need to add this currently unused fallback
                        // to handle any new cases that might be added
                        // in the future:
                        EmptyView()
                    }
                }
                
                
                Text(cat.strCategoryDescription)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }.padding(8)
        }
    }
}

#Preview {
    CategoryDetailView(cat: Category(idCategory: "1", strCategory: "beef", strCategoryThumb: "", strCategoryDescription: "beef menu"))
}
