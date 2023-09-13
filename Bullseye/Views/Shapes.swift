//
//  Shapes.swift
//  Bullseye
//
//  Created by Roman on 9/7/23.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
         Text("RoundedImageViewStroked")
                .overlay(
                    Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 10.0)
                )
               
        }
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
