//
//  CharacterListService.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import Foundation

struct CharacterListService: APIDataProvidable {
    // Today only looking for characters from SpiritidAway. TODO: - update to fetch characters from any anime
    func fetchCharacters(callback: @escaping(Result<ListTLD, NetworkError>) -> Void) {
        // Compose URL
        guard let finalURL = URL(string: "https://kitsu.io/api/edge/anime/176/characters") else {callback(.failure(.invalidURL)); return}
        var urlRequest = URLRequest(url: finalURL)
        // DataTask
        perform(urlRequest) { result in
            switch result {
            case.success(let charactersData):
                // Decode the data
                do {
                    let decodedListTLD = try JSONDecoder().decode(ListTLD.self, from: charactersData)
                    callback(.success(decodedListTLD))
                } catch {
                    callback(.failure(.thrownError(error)))
                }
            case.failure:
                callback(.failure(.unableToDecode))
            }
        }
        // Decode Data
    }
}
