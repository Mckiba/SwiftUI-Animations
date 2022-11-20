//
//  BallDrop.swift
//  Animations
//
//  Created by McKiba Williams on 11/19/22.
//

import SwiftUI

struct BallDrop: View {
    
    @State var progress: Double = 0.25
    
    var body: some View {
        VStack{
            ZStack{
                
                
                
                
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 100)
                    .foregroundStyle(
                        .white.gradient.shadow(
                            .inner(color: .gray, radius: 25, x: 25,y: 25)
                        )
                    )
                
                //
                Circle()
                    .trim(from: 0.25, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 100)
                    .foregroundStyle(
                        .white.gradient.shadow(
                            .inner(color: .pink, radius: 25, x: 25,y: 25)
                        )
                    )
                    .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: progress)
                
                
                Circle()
                    .trim(from: 0.25, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 100)
                    .foregroundStyle(
                        .white.gradient.shadow(
                            .inner(color: .pink, radius: 25, x: 25,y: 25)
                        )
                    ).rotation3DEffect(.degrees(180), axis: (x: 0, y:1 , z: 0))

                    .animation(.easeOut(duration: 3).repeatForever(autoreverses: false), value: progress)

                
                
                    Rectangle()
                    .trim(from: 0, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 20, height: 100)
                    .foregroundStyle(
                        .pink
                    )
 
                    
                
            }
            
            Button(action: {
                increaseProgress()
            }, label: {
                Text("Begin")
            })
            
        }
    }
    
    func increaseProgress(){
        repeat {
            progress += 0.01
            print(progress)
        }while(progress <= 0.75)
    }
    
}

struct BallDrop_Previews: PreviewProvider {
    static var previews: some View {
        BallDrop()
    }
}
