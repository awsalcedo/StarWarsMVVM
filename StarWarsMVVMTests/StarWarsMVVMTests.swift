//
//  StarWarsMVVMTests.swift
//  StarWarsMVVMTests
//
//  Created by ALEX WLADIMIR SALCEDO SILVA on 16/9/24.
//

import Testing
@testable import StarWarsMVVM

extension Tag {
    @Tag static var repository: Self
}

@Suite("Prueba del repository del Star Cards", .tags(.repository))
struct StarWarsMVVMTests {
    let repository = RepositoryTest()
    let viewModel = StarCardViewModel(repository: RepositoryTest())

    @Test("Prueba de carga de datos del repositorio")
    func dataLoad() throws {
        let data = try repository.getData()
        #expect(data.count == 4)
    }
    
    @Test("Prueba de carga de datos del ViewModel")
    func dataLoadVM() throws {
        #expect(viewModel.cards.count == 4)
    }

}
