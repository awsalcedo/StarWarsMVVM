//
//  ContentView.swift
//  StarWarsMVVM
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 7/9/24.
//

import SwiftUI

struct ContentView: View {
    // El ViewModel se debe instanciar con un @State lo cual provoca que se actualice la vista si alguna variable (OJO solo variables dentro del VM) en el viewModel ha cambiado
    @State var viewModel = StarCardViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.cards) { card in
                    StarCardView(card: card)
                }
            }
            .navigationTitle("Star Wars")
        }
    }
}


#Preview {
    // Aquí puedo indicarle que data quiero que cargue, en este caso la de prueba
    ContentView(viewModel: StarCardViewModel(repository: RepositoryTest()))
    
    // Con esto le indico que cargue la data de producción
    //ContentView()
}
