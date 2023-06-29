//
//  CharacterListViewModel.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation

protocol CharacterListViewModelDelegate: CharacterListTableViewController {
    func characterListFetchedSuccessfully()
}

class CharacterListViewModel {
    // MARK: - Properties
    // This protocol/delegate sends information from view model to table view when the data was successfully fetched from API
    weak var delegate: CharacterListViewModelDelegate?
    // SOT
    var characterList: [CharacterDataDictionary] = []
    private let service: CharacterListServiceable
    
    // Dependency Injection
    init(injectedDelegate: CharacterListViewModelDelegate, injectedCharacterService: CharacterListService = CharacterListService()) {
        self.delegate = injectedDelegate
        self.service = injectedCharacterService
        fetchCharacterList()
    }
    // MARK: - Methods
    func fetchCharacterList(){
        service.fetchCharacters { result in
            switch result {
            case .success(let tld):
                    self.characterList = tld.data
                    self.delegate?.characterListFetchedSuccessfully()
            case.failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
