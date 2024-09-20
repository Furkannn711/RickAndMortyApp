//
//  MainVM.swift
//  RickAndMortyApp
//
//  Created by furkan on 19.02.2024.
//

import Foundation

protocol MainVMDelegate {
    func notify(_ notify: MainVMNotify)
}

enum MainVMNotify {
    case characterReloadData
    case locationReloadData
}

enum MainCellType {
    case location
    case character
}

final class MainVM {
    var characterList: [CharacterResultsResponse] = []
    var locationList: [LocationResultResponse] = []
    var mainCellTypes: [MainCellType] = [.location, .character]
    var delegate: MainVMDelegate?
    private var characterNextPage: String?
    private var locationNextPage: String?
    
    let service: URLSessionServiceManager = .shared
    
    func fetchCharacter(character: [URL]) {
        characterList.removeAll()
        
        for characterUrl in character {
            service.fetchCharacter(character: characterUrl) { response in
                self.characterList.append(response)
                self.notify(.characterReloadData)
            }
        }
    }
    
    func fetchLocations() {
        service.fetchLocations(nextPage: locationNextPage) { response in
            self.locationNextPage = response.info?.next ?? ""
            self.locationList.append(contentsOf: response.results ?? [])
            self.notify(.locationReloadData)
        }
    }
    
    func characterListCount() -> Int { characterList.count }
    func locationListCount() -> Int { locationList.count }
    
    private func notify(_ notify: MainVMNotify) {
        delegate?.notify(notify)
    }
}


