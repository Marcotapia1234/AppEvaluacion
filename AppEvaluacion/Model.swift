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

struct Registro: Identifiable, Codable, Hashable {
    @DocumentID var id: String?// Identificador único de FireStore
    //var valoracion: Satisfaccion
    var taller: String
    var opinion: String
    var aprendido: String
    var usuarioE :String
    var valorcarita:Int
}

enum Satisfaccion: String{
    case alto = "alto"
    case medio = "medio"
    case bajo = "bajo"
}


