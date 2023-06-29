//
//  CharacterService.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation

// Remove concrete type relatioships and rely on abstraction
protocol CharacterServiceable {
    func fetch(url: String, callback: @escaping(Result<CharacterTLD, NetworkError>) -> Void)
}

struct CharacterService: APIDataProvidable, CharacterServiceable {
    func fetch(url: String, callback: @escaping (Result<CharacterTLD, NetworkError>) -> Void) {
        // Pass in URL
        guard let finalURL = URL(string: url) else { callback(.failure(.invalidURL)); return }
        let urlRequest = URLRequest(url: finalURL)
        // DataTask
        perform(urlRequest) { result in
            switch result {
            case .success(let character):
                // Decode the data
                do {
                    let decodedCharacterTLD = try JSONDecoder().decode(CharacterTLD.self, from: character)
                    callback(.success(decodedCharacterTLD))
                } catch {
                    callback(.failure(.thrownError(error)))
                }
            case .failure(_):
                callback(.failure(.unableToDecode))
            }
        }
    }
    
    
    
}
