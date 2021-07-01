//
//  SearchBar.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 01/07/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var text = ""
    
    @State private var isEditing = true
    @State private var isLoading = false
    var body: some View {
        ZStack(alignment:.leading){
            Color.graySearchBackground
                .frame(width: 270, height: 36)
                .cornerRadius(8)
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading,10)
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading,-7)
                    .padding(.horizontal,10)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isEditing = true
                    }
                
                if isLoading{
                    Color.red
                        .frame(width: 35, height: 35)
                }else{
                Button(action: {
                    //clear text
                    text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.graySearchText)
                        .frame(width: 35, height: 35)
                })
                .padding(.trailing,18)
                }
                
                Button(action: {
                    //cloear text ,hide both buttons , give up first responder
                    text = ""
                    isEditing = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding(.trailing,10)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            SearchBar()
                .padding()
        }
    }
}
