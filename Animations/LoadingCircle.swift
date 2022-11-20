//
//  LoadingCircle.swift
//  Animations
//
//  Created by McKiba Williams on 11/19/22.
//

import SwiftUI

struct LoadingCircle: View {
    @State var spin: Bool = false

    var body: some View {
        
        VStack(spacing: 100){
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 15))
                .frame(width: 100)
                .foregroundColor(.green)
                    .opacity(0.4)
                                
                Circle ()
                .trim(from: 0, to: 0.2)
                .stroke (style: StrokeStyle(lineWidth: 15))
                .frame(width: 100)
                .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: spin ? 90 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: spin)
            }
            
            Button(action: {
                spin = true
            }, label: {
                Text("Start Spinning")
                    .font(.title)
            })

        }
    }
}

struct LoadingCircle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCircle()
    }
}



