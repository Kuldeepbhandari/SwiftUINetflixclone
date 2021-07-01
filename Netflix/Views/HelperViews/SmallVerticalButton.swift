//
//  SmallVerticalButton.swift
//  Netflix
//
//  Created by Kuldeep Bhandari on 23/06/21.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text:String
    var isOnImage:String
    var isOffImage:String
    var isOn:Bool
    
    var imageName:String{
       if isOn{
            return isOnImage
        }else{
            return isOffImage
        }
    }
    
    var action : () -> Void
    var body: some View {
        
        Button {
            action()
        } label: {
            VStack{
                Image(systemName: imageName)
                Text(text)
                    .font(.system(size: 14))
                    .bold()
            }
            .foregroundColor(.white)
        }

        
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: false){
                print("tapped")
            }
        }
        }
        
}
