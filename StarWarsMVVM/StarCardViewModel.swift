//
//  StarCardViewModel.swift
//  StarWarsMVVM
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 7/9/24.
//

import SwiftUI

/*
 @Observable permite que cualquier propiedad variable que haya en esta clase, cuando se
 actualice en la clase al ponerla en la vista se refresque la vista
 */

@Observable
final class StarCardViewModel {
    let repository: DataRepository
    
    var cards: [StarCard]
    
    //DataRepository = Repository() con esto le digo que cargue los datos de producció o los de pruebas
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            cards = try repository.getData()
        } catch {
            cards = []
        }
    }
}
