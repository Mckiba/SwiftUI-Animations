//
//  BallDrop.swift
//  Animations
//
//  Created by McKiba Williams on 11/19/22.
//

import SwiftUI

struct BallDrop: View {
    @State var progress: CGFloat = 0.25
    let duration = 2.0
    let dropDuration = 2.0
    let circleDelay = 0.60
    let circleWidth = 150.00
    @State var isClicked: Bool = false
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 22, lineCap: .round))
                    .frame(width: 150)
                    .foregroundStyle(.white.gradient.shadow(.inner(color: .gray, radius: 25, x: 25,y: 25)))
                
                Text(progress.description.prefix(4))
                
                CustomCircle(color: Color.purple,trimStart: 0.25, trimEnd: progress, progress: progress)
                
                CustomCircle(color: Color.purple,trimStart: 0.25, trimEnd: progress, progress: progress)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y:1 , z: 0))
                 
                if progress > 0.725 {
                    Rectangle()
                        .trim(from: 0, to: 0.001)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .foregroundStyle(
                            .purple.opacity(0.8)
                        )
                        .frame(width: circleWidth, height: 100)
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y:1 , z: 0))
                        .animation(.easeOut ,value: progress)
                        .offset(y: progress > 0.735 ? circleWidth : 0)
                        .offset(x: 50.0)
                }
            }.padding(.vertical)
            
            Slider(value: $progress, in: 0.28...0.75)
        }.onAppear(perform: {
            repeat {
                progress += 0.01
            }while(progress < 0.73)
        })
    }
}


struct CustomCircle : View  {
    var color: Color
    var trimStart, trimEnd, progress: CGFloat
    var body: some View {
        
        Circle()
         .trim(from: trimStart, to: trimEnd)
            .stroke(style: StrokeStyle(lineWidth: 22, lineCap: .round))
            .frame(width: 150)
            .foregroundStyle(
                .white.gradient.shadow(
                    .inner(color: color, radius: 25, x: 25,y: 25)))
            .animation(.easeOut, value: progress)
    }
}



struct BallDrop_Previews: PreviewProvider {
    static var previews: some View {
        BallDrop()
    }
}
