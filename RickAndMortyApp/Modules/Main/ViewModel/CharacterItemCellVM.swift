//
//  CharacterItemCellVM.swift
//  RickAndMortyApp
//
//  Created by furkan on 19.02.2024.
//

import Foundation

final class CharacterItemCellVM {
    
    private let characterItem: CharacterResultsResponse
    
    init(characterItem: CharacterResultsResponse) {
        self.characterItem = characterItem
       
    }
   
    var chracterName: String { characterItem.name ?? "" }
    
    
    
}


