//
//  Model.swift
//  AppEvaluacion
//
//  Created by Marco on 9/5/24.
//

import Foundation

struct Registro{
    var valoracion: Satisfaccion = Satisfaccion.alto
    var opinion: String = ""
    var aprendido: String = ""
}

enum Satisfaccion: String{
    case alto = "alto"
    case medio = "medio"
    case bajo = "bajo"
}
