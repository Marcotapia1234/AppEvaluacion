//
//  EvaluacionViewModel.swift
//  AppEvaluacion
//
//  Created by Marco on 13/5/24.
//

import SwiftUI
import Foundation
import FirebaseFirestore

class EvaluacionViewModel: ObservableObject {
    
    //@Published var restaurants: [Restaurant] = []
    //@Published var selectedRestaurant: Restaurant?
    //@Published var showSettings: Bool = false
    //@Published var restaurantsDB: [Restaurant] = []

    //@ObservedObject var almacen: SettingStore
    
   var databaseReference = Firestore.firestore().collection("valoraciones")
    
    func addValoracion(valoracion: Registro){
        do{
        _ = try databaseReference.addDocument(from: valoracion)
        } catch {
            print("Erro adding valoracion: \(error.localizedDescription)")
        }
    }
}
   
