//
//  Repository.swift
//  StarWarsMVVM
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 7/9/24.
//

import Foundation

protocol DataRepository {
    var url: URL { get }
}

/// Permite leer un archivo json desde local
extension DataRepository {
    func getData() throws -> [StarCard] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // Permite convertir los campos que vienen en el JSON en formato Snake Case a Camel Case ejemplo: planeta_origen a planetaOrigen
        return try decoder.decode([StarCardDto].self, from: data).map(\.toCard)
    }
}

//La func getData está disponible tanto para Repository y RepositoryTest porque
//ambos conforman el mismo protocolo DataRepository
struct Repository: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "StarWars", withExtension: "json")!
    }
    
    
}

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "StarWars Test", withExtension: "json")!
    }
    
    
    
}
