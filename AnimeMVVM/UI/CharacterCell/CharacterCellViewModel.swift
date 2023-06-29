//
//  CharacterCellViewModel.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation
protocol CharacterCellViewModelDelegate: CharacterTableViewCell {
    func configureCell(with character: Attributes)
}

class CharacterCellViewModel {
    
    // MARK: - Properties
    weak var delegate: CharacterCellViewModelDelegate?
    private let service: CharacterServiceable
    var listResult: CharacterDataDictionary
    
    init(listResult: CharacterDataDictionary, injectedDelegate: CharacterCellViewModelDelegate, injectedService: CharacterServiceable = CharacterService()) {
        self.delegate = injectedDelegate
        self.service = injectedService
        self.listResult = listResult
        fetchCharacter()
    }
    
    // MARK: - Methods
    func fetchCharacter(){
        let characterURLString = listResult.relationships.character.links.related
        service.fetch(url: characterURLString) { result in
            switch result {
            case .success(let character):
                DispatchQueue.main.async {
                    self.delegate?.configureCell(with: character.data.attributes)
                }
            case . failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
