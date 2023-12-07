//
//  ContentView.swift
//  ThemealDb_Swiftui
//
//  Created by mahesh lad on 29/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var categoryViewModel = CatgetoryViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
       
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) { //2
                        
                        ForEach(categoryViewModel.categories ) { cat in
                            NavigationLink(destination:  CategoryDetailView(cat: cat)) {
                                VStack{
                                    
                                    AsyncImage(url: URL(string: cat.strCategoryThumb)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 300, maxHeight: 100)
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
                                    
                                    Text(cat.strCategory)
                                        .font(.headline)
                                    //  Text(cat.strCategoryDescription)
                                        .font(.body)
                                    
                                }.padding(8)
                            }
                        }
                        
                    }
                } //scroll
            } // Navigationview
            .task {
                do {
                    try  await categoryViewModel.getCategories()
                } catch  {
                    print(error.localizedDescription)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Categories")
    }
}

#Preview {
    ContentView()
}
