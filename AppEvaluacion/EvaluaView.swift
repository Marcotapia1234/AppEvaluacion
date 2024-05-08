//
//  EvaluaView.swift
//  AppEvaluacion
//
//  Created by Marco on 7/5/24.
//

import SwiftUI

struct EvaluaView: View {
   // @State private var rectangleColorChange = false
    @State private var text: String = ""
    @State private var text1: String = ""
    var body: some View {
        VStack {
                 
            ExtractedView()
            HStack{
                CaritaView (texto:"ALTO", icon: "hand.thumbsup")
                CaritaView (texto:"MEDIO", icon: "hand.point.right")
                CaritaView (texto:"BAJO", icon: "hand.thumbsdown")
            }
            
            Text("Qué te ha parecido el taller")
                .fontWeight(.black)
            
            TextField("Ingrese texto aquí", text: $text)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())

             
            Text("Has aprendido algo nuevo")
                .fontWeight(.black)
            
            TextField("Ingrese texto aquí", text: $text)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())                    }
                    .padding()
        
    }
    
}

struct EvaluaView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluaView()
    }
}

struct ExtractedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text("Valora el taller")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
        }
    }
}
struct CaritaView: View{
    var texto:String
    var icon:String
    var body: some View{
        VStack{
            
                Text(texto)
                
                Image(systemName: icon)
                    .font(.system(size: 70))
                
            
            
        }
    }
}
