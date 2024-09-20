//
//  URLSessionServiceManager.swift
//  RickAndMortyApp
//
//  Created by furkan on 19.02.2024.
//

import Foundation

final class URLSessionServiceManager {
    
    static let shared = URLSessionServiceManager()
    
    private init() { }
    
    func fetchCharacter(character: URL, completion: @escaping (CharacterResultsResponse) -> ()) {
        URLSession.shared.dataTask(with: character) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else {
                guard let data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(CharacterResultsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func fetchLocations(nextPage: String? = nil, completion: @escaping (LocationResponse) -> ()) {
        guard let url = URL(string: nextPage ?? "https://rickandmortyapi.com/api/location") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            } else {
                guard let data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(LocationResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
