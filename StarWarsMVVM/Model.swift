//
//  Model.swift
//  StarWarsMVVM
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 7/9/24.
//

import Foundation

struct StarCardDto: Decodable {
    let id: Int
    let nombre: String
    let raza: String
    let descripcion: String
    let planetaOrigen: String
    let epoca: String
    let afiliacion: String
    let habilidades: String
    let armas: String
    let imagen: String
}

extension StarCardDto {
    var toCard: StarCard {
        StarCard(id: id,
                 nombre: nombre,
                 raza: raza,
                 descripcion: descripcion,
                 planetaOrigen: planetaOrigen,
                 epoca: epoca,
                 afiliacion: afiliacion.components(separatedBy: ", ").map(\.capitalized),
                 habilidades: habilidades.components(separatedBy: ", ").map(\.capitalized),
                 armas: armas.components(separatedBy: ", ").map(\.capitalized),
                 imagen: imagen)
    }
}

struct StarCard: Identifiable, Hashable {
    let id: Int
    let nombre: String
    let raza: String
    let descripcion: String
    let planetaOrigen: String
    let epoca: String
    let afiliacion: [String]
    let habilidades: [String]
    let armas: [String]
    let imagen: String
}

/*
 Como en SwiftUI se debe separar al máximo en componentes, es una buena práctica tener datos de pruebas que servirán en este caso para el componente
 StarCardView para poder visualizar como está quedando el diseño de nuestra vista
 */
extension StarCard {
    static let test = StarCard(id: 6629,
                               nombre: "Luke Skywalker",
                               raza: "Humano",
                               descripcion: "Héroe de la Alianza ",
                               planetaOrigen: "Tatooine",
                               epoca: "Era del Imperio Galáctico",
                               afiliacion: ["Alianza Rebelde", "Nueva República"],
                               habilidades: ["Uso de la Fuerza", "Combate con sable de luz", "Pilotaje"],
                               armas: ["Sable de luz"],
                               imagen: "lukeskywalker"
    )
}
