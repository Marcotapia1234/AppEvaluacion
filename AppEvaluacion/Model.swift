//
//  Model.swift
//  AppEvaluacion
//
//  Created by Marco on 9/5/24.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseFirestore

struct Registro: Identifiable, Codable {
    @DocumentID var id: String?// Identificador único de FireStore
    //var valoracion: Satisfaccion = Satisfaccion.alto
    var opinion: String = ""
    var aprendido: String = ""
    //var usuarioE :String = ""
}

enum Satisfaccion: String{
    case alto = "alto"
    case medio = "medio"
    case bajo = "bajo"
}


