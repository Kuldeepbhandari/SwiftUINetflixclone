//
//  PlayButton.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 23/06/21.
//

import SwiftUI

struct PlayButton: View {
    var text:String
    var imageName:String
    var backgroundColor : Color = .white
    var action:() -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack{
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()

            }
            .padding(.vertical,8)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .background(backgroundColor)
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        })
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(text: "Play", imageName: "play.fill"){
            print("tapped")
        }
    }
}
