//
//  Preloader.swift
//  Animations
//
//  Created by McKiba Williams on 12/23/22.
//

import SwiftUI

struct Preloader: View {
    
    @State var active: Bool = false
    
    var body: some View {
        ZStack(alignment: .center){
            
            HStack(spacing: 120) {
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.purple)
                    .offset(x: active ? -75: 0).opacity(active ? 0.03: 1).animation(.easeOut.delay(1.4).repeatForever(autoreverses: false), value: active)
                
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.purple)
                    .offset(x: active ? -140: 0).opacity(1).animation(.easeOut.delay(1.4).repeatForever(autoreverses: false), value: active)
                
                Circle()
                    .frame(width: 40)
                    .foregroundColor(.purple)
                    .offset(x: active ? -140: 0).opacity(active ? 1: 0.0).animation(.easeOut.delay(1.4).repeatForever(autoreverses: false), value: active)
                
            }.offset(x:90)
            Button("Start"){
                active.toggle()
            }.offset(y:100)
        }
    }
}

struct Preloader_Previews: PreviewProvider {
    static var previews: some View {
        Preloader()
    }
}
