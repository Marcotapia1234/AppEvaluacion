//
//  EvaluacionViewModel.swift
//  AppEvaluacion
//
//  Created by Marco on 13/5/24.
//

import SwiftUI
import Foundation
import Combine
import FirebaseFirestore

class EvaluacionViewModel: ObservableObject {
    
    //@Published var restaurants: [Restaurant] = []
    //@Published var selectedRestaurant: Restaurant?
    //@Published var showSettings: Bool = false
    //@Published var restaurantsDB: [Restaurant] = []

    //@ObservedObject var almacen: SettingStore
    
   var databaseReference = Firestore.firestore().collection("valoraciones")
    private var listener: ListenerRegistration?
    @Published var valoracionesDB : [Registro] = []
    
    func addValoracion(valoracion: Registro){
        do{
        _ = try databaseReference.addDocument(from: valoracion)
        } catch {
            print("Erro adding valoracion: \(error.localizedDescription)")
        }
    }
    
    func startListeningValoraciones() {
            listener = databaseReference.addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                self.valoracionesDB = documents.compactMap { document in
                    do {
                        let valoracion = try document.data(as: Registro.self)
                        return valoracion
                    }catch {
                        return nil
                    }
            }
        }
    }
    
    func stopListeningValoraciones() {
           listener?.remove()
       }
    
    func fetchValoraciones() {
        databaseReference.getDocuments { querySnapshot, error in
            if let error = error {
                /*Contemplo error de conexión*/print(error)
                return
            }
        //Si hay mensajes en Firebase, los guardo en documents, sino print a consola
            guard let documents = querySnapshot?.documents else {
                return
            }
            if documents.isEmpty {
                // La colección está vacía
            } else {
                // La colección no está vacía, asignamos al array mensajesDB
                self.valoracionesDB = documents.compactMap { document in
                    do {
                        let valoracion = try document.data(as: Registro.self)
                        return valoracion
                    }catch {
                        return nil
                    }
            }
        }
        }
    }
   
    
   
        
}

   
