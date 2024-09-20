//
//  DetailVM.swift
//  RickAndMortyApp
//
//  Created by furkan on 24.03.2024.
//

import Foundation

final class DetailVM {
    
    enum TableViewType {
        case characterImage
        case characterNameStatus
    }
    
    let characterResponse: CharacterResultsResponse?
    var tableViewType: [TableViewType] = []
    
    init(characterResponse: CharacterResultsResponse?) {
        self.characterResponse = characterResponse
        tableViewType.append(.characterImage)
        tableViewType.append(.characterNameStatus)
    }
}
