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
    @State var manoAlto : Bool = false
    @State var manoMedio : Bool = false
    @State var manoBajo : Bool = false
    @State var evaluado : Bool = false
    
    var registro = Registro() //inicializa en Model
    
    var body: some View {
        
        
        //self.evaluado = self.manoBajo && self.manoAlto && self.manoMedio
        
            ZStack {
                    
                    Color.purple.edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center, spacing: 20){
                 
            ExtractedView()
            
                HStack{
                
                    CaritaView (texto:"ALTO", icon: "hand.thumbsup", selecc: $manoAlto, eval: $evaluado, manoA: $manoAlto, manoB: $manoBajo,manoM: $manoMedio)
                    CaritaView (texto:"MEDIO", icon: "hand.point.right", selecc: $manoMedio, eval: $evaluado, manoA: $manoAlto, manoB: $manoBajo,manoM: $manoMedio)
                    CaritaView (texto:"BAJO", icon: "hand.thumbsdown", selecc: $manoBajo, eval: $evaluado, manoA: $manoAlto, manoB: $manoBajo,manoM: $manoMedio)
                
                    .padding(.bottom, 20)
            }
              
                VStack(alignment: .leading, spacing: 15) {
                    Text("Qué te ha parecido el taller")
                        .fontWeight(.black)
            
                    TextField("Ingrese texto aquí", text: $text)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                    Text("Has aprendido algo nuevo")
                        .fontWeight(.black)
            
                    TextField("Ingrese texto aquí", text: $text1)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
          }
             .padding(.horizontal, 20)

                HStack(spacing: 20) {
                      Button(action: {
                                       
                          }) {
                                Text("Guardar")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                             }
                                    
                        Button(action: {
                                        
                          }) {
                                Text("Salir")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                             }
                        }
                          .padding(.top, 20)
                    }
                          .padding()
        
        }
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
    //@State var selecc = false
    @Binding var selecc : Bool
    @Binding var eval : Bool
    @Binding var manoA : Bool
    @Binding var manoB : Bool
    @Binding var manoM : Bool
    
    var body: some View{
        VStack{
                Text(texto)
            
                Button(action: {
                    eval = manoA || manoB || manoM
                    if !eval {
                        selecc.toggle()
                    }
                    else {} }) {
                        Image(systemName: icon)
                            .font(.system(size: 70))
                            .foregroundColor(selecc ?  .yellow : .primary)
                }
                Spacer()
            }
              
                   
          }
    }

