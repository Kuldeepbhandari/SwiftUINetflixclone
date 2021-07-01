//
//  HomeStack.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 30/06/21.
//

import Foundation
import SwiftUI

struct HomeStack: View {
    
    var homeVM:HomeVM
    @Binding var movieDetailToShow:Movie?
    var topRowSelection:HomeTopRow
    var selectedGenere:HomeGenere
    
    var body: some View {
        ForEach(homeVM.allCategories, id: \.self) { categories in
            VStack{
                //title name hstack
                
                HStack{
                    Text(categories)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                //horizontal scrollview
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack{
                        ForEach(homeVM.getMovies(in: categories, andHomeRow: topRowSelection, addGenere: selectedGenere)) { movies in
                            StandardHomeView(movie: movies)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal,20)
                                .onTapGesture {
                                    movieDetailToShow = movies
                                }
                        }
                    }
                }
            }
        }
    }
}
