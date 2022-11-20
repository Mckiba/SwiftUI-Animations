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
                    .foregroundColor(.orange)
                        .opacity(0.3)
                                    
                    Circle ()
                    .trim(from: 0, to: 0.2)
                    .stroke (style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 100)
                    .foregroundColor(.orange)
                        .rotationEffect(Angle(degrees: spin ? 360 : 0))
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: spin)
                    
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 15))
                    .frame(width: 150)
                    .foregroundColor(.pink)
                        .opacity(0.3)
                    
                    Circle ()
                    .trim(from: 0, to: 0.12)
                    .stroke (style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .frame(width: 150)
                    .foregroundColor(.pink)
                        .rotationEffect(Angle(degrees: spin ? 360 : 0))
                        .rotation3DEffect(.degrees(180), axis: (x:1, y: 1, z: 0))
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: spin)
                }.onAppear{spin = true}
            }
        }
    }

    struct LoadingCircle_Previews: PreviewProvider {
        static var previews: some View {
            LoadingCircle().preferredColorScheme(.dark)
        }
    }



