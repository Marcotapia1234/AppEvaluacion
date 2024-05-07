//
//  ContentView.swift
//  AppEvaluacion
//
//  Created by Marco on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView {
            VStack{
            Image("evaluacion2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: EvaluaView()){
                    
                        Text("Evalúa el taller!")
                           .fontWeight(.black)
                           .font(.title)
                           .padding()
                           .background(Color.purple)
                           .cornerRadius(40)
                           .foregroundColor(.white)
                           .padding(10)
                           .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.purple, lineWidth: 5)
                           )
                    
                }
                
                    
        }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
