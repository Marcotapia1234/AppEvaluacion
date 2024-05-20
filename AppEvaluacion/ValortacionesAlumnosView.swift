//
//  ValortacionesAlumnosView.swift
//  AppEvaluacion
//
//  Created by Marco on 16/5/24.
//

import SwiftUI

struct ValortacionesAlumnosView: View {
    
    @State private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    
    @State private var valoracionesFB : [Registro] = []
    @ObservedObject private var valoracionesVM = EvaluacionViewModel()
    @State var f: Bool = false
    @Binding var taller : String
    @State var v1: Int = 0
    @State var v2: Int = 0
    @State var v3: Int = 0
    
    
    
    var body: some View {
        
        Button (action: {
            calculaValoraciones(VFB: $valoracionesFB, taller: taller,v1: $v1,v2:$v2,v3:$v3)
        }) {
            Text("Calcula")
        }
        
        HStack{
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.45)
                .padding()
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.85)
                .padding()
            DibujaPorcentaje(purpleGradient: $purpleGradient, porcent: 0.95)
                .padding()
            }
        .onAppear {
            
            valoracionesVM.fetchValoraciones()
            valoracionesVM.startListeningValoraciones()
            
            // Utilizamos el método map para obtener un array de String con el campo texto de cada mensaje y ordenados por la marca de tiempo
            //Cargamos en la variable, los mensajes ordenados
            valoracionesFB = valoracionesVM.valoracionesDB
            
            DispatchQueue.main.async {
                    valoracionesFB = valoracionesVM.valoracionesDB
                }
            
        }
        .onDisappear {
            valoracionesVM.stopListeningValoraciones()
        }
        }
        
    }
   

struct calculaValoraciones: View {
    @Binding var VFB: [Registro]
    var taller : String
    @Binding var v1:Int
    @Binding var v2:Int
    @Binding var v3:Int
    
    var c1 = 0
    var c2 = 0
    var c3 = 0
    
    var body: some View {
    
        ForEach(VFB.filter{$0.taller == taller}, id: \.self) { elemento in
            switch elemento.valorcarita {
                case 0 :
                    c1 += 1
                case 1 :
                    c2 += 1
                case 2 :
                    c3 += 1
                default:
                    print ("Hola!")
            }
    }
        // Actualiza los bindings con los resultados del conteo
              // DispatchQueue.main.async {
                 //  v1 = c1
              //     v2 = c2
            //       v3 = c3
         //      }
}
}

/*
struct ValortacionesAlumnosView_Previews: PreviewProvider {
    static var previews: some View {
        ValortacionesAlumnosView(taller: )
    }
}
*/
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
