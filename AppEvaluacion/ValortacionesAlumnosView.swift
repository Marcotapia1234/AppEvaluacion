//
//  ValortacionesAlumnosView.swift
//  AppEvaluacion
//
//  Created by Marco on 16/5/24.
//

import SwiftUI

struct ValortacionesAlumnosView: View {
    @State private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        HStack{
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.45)
                .padding()
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.85)
                .padding()
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.95)
                .padding()
            }
        }
        
    }
   




struct ValortacionesAlumnosView_Previews: PreviewProvider {
    static var previews: some View {
        ValortacionesAlumnosView()
    }
}

struct DibujaPorcentaje: View {
    @Binding var purpleGradient: LinearGradient
    var porcent : CGFloat
    var body: some View {
        ZStack {
            //PRIMER CIRCULO
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 10)
                .frame(width: 60, height: 60)
            
            Circle()
                .trim(from: 0, to: porcent)
                .stroke(purpleGradient, lineWidth: 10)
                .frame(width: 60, height: 60)
                .overlay(
                    VStack {
                        let stringValue = String(format: "%.2f", porcent)
                        Text(stringValue)
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                        /*Text("Complete")
                         .font(.system(size:10, design: .rounded))
                         .bold()
                         .foregroundColor(Color(.systemGray))*/
                    }
                )
        }
    }
}
