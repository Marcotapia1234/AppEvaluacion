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
    var listado : [String] = ["Habilidades Sociales", "Apps Developers", "Desarrollo de Proyectos"]
    @State var tallerseleccionado: String = ""
    @State var manoAlto : Bool = false
    @State var manoMedio : Bool = false
    @State var manoBajo : Bool = false
    @State var evaluado : Bool = false
    @State var valorcarita: Int = 0
    @StateObject var evaluaViewModel = EvaluacionViewModel()
    @EnvironmentObject private var usuarioact: AuthViewModel
    //var registro = Registro() //inicializa en Model
    
    var body: some View {
        
        
        //self.evaluado = self.manoBajo && self.manoAlto && self.manoMedio
        //en principio se queria utilizar la variable para seleccionar al boton de eleccion
        
        NavigationView {
            ZStack {
                        
                        Color.purple.edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center, spacing: 20){
                     
                ExtractedView(listado: listado, tallerselec: $tallerseleccionado)
                
                    HStack{
                    
                        CaritaView (texto:"ALTO", icon1: "alegre",icon2: "alegre2", selecc: $manoAlto, valorA: $valorcarita)
                        Spacer()
                        CaritaView (texto:"MEDIO", icon1: "duda",icon2: "duda2", selecc: $manoMedio, valorA: $valorcarita)
                        Spacer()
                        CaritaView (texto:"BAJO", icon1: "triste",icon2: "triste2", selecc: $manoBajo, valorA: $valorcarita)
                    }.padding()
                  
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
                              let usuario = usuarioact.user?.email ?? ""
                              let opinion = Registro(taller: tallerseleccionado, opinion: text, aprendido: text1,usuarioE: usuario, valorcarita:valorcarita)
                              
                              evaluaViewModel.addValoracion(valoracion: opinion)
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
                        if (usuarioact.user?.email == "ana.t@gmail.com"){
                            
                            NavigationLink(destination: ValortacionesAlumnosView(taller: $tallerseleccionado)) {
                                Text("Estadisticas Taller Seleccionado")
                            }
                        }
                        
                            }
                              .padding(.top, 20)
                        }
                              .padding()
            
            }
        }
    }
}


struct EvaluaView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluaView()
    }
}

struct ExtractedView: View {
    var listado : [String]
    @Binding var tallerselec: String
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text("Valora el taller")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Menu("Selecciona el taller") {
                ForEach(listado,id: \.self) {elemento in
                            Button(elemento) {
                                // Acción cuando se selecciona la opción 1
                                tallerselec = elemento
                                print(tallerselec)
                            }
                }
                           
           
        }
    }
}
}

struct CaritaView: View{
    var texto:String
    var icon1:String
    var icon2:String    //@State var selecc = false
    @Binding var selecc : Bool
    @Binding var valorA : Int
    //@Binding var eval : Bool
    /*@Binding var manoA : Bool
    @Binding var manoB : Bool
    @Binding var manoM : Bool*/
    
    //se han creado tres variables que estaran dentro del botón para comprobar si han sido llamadas y está activado alguna.
    //al seleccionar una de ellas cambia de color y desactiva las dos.
    
    var body: some View{
        VStack(alignment: .center){
                
            
                Button(action: {
                    //eval = manoA || manoB || manoM
                    if selecc {
                        selecc.toggle()
                    }
                    else {
                        selecc.toggle()
                        switch texto{
                        case "ALTO" : valorA = 0
                        case "MEDIO" : valorA = 1
                        case "BAJO" : valorA = 2
                        default:
                            valorA = 0
                        }
                        
                    } }) {
                        //if selecc == true
                        if (!selecc == true) {
                            Text(texto)
                            Image(icon1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                        }else{
                            Text(texto)
                            Image(icon2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)                     //.foregroundColor(selecc ?  .primary : .yellow)
                        }
                            
                            }
            
                        }
                Spacer()
            }
              
                   
  }
    

