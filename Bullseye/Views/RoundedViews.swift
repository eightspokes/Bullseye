//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Roman on 9/11/23.
//

import SwiftUI


struct RoundedImageViewStroked: View {
    var systemName:  String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("StrokedTextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName:  String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("FilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
                
            )
    }
}

struct RoundedIntegerView: View {
    var label:  String
    @Binding var value: Int
    var body: some View {
        VStack{
            Text(label)
            .font(.caption)
            .bold()
            .kerning(1.5)
            .foregroundColor(Color("StrokedTextColor"))
            
            
            
            
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 68, height: 55.78125)
            .cornerRadius(21)
            .overlay(
            RoundedRectangle(cornerRadius: 21)
            .inset(by: 1)
            .stroke(Color("StrokedTextColor"), lineWidth: 2)
            .overlay(
                Text("\(value)".uppercased())
                .font(
                Font.custom("SF Pro Text", size: 21)
                .weight(.bold)
                )
                .foregroundColor(Color("StrokedTextColor"))
            )
            )
        }
    }
}





struct PreviewView: View{
    var body: some View{
        VStack{
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedIntegerView(label: "SCORE", value: .constant(999))
        }
        
    }
}



struct RoundedImageViewStroked_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
           
            PreviewView()
                .preferredColorScheme(.light)
        }
        
    }
}
