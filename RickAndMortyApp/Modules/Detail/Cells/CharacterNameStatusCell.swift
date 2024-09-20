//
//  CharacterNameStatusCell.swift
//  RickAndMortyApp
//
//  Created by furkan on 24.03.2024.
//

import UIKit

final class CharacterNameStatusCell: UITableViewCell {
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCharacterStatus(name: String?, status: StatusType) {
        characterNameLabel.text = name
        characterStatusLabel.text = status.rawValue
        
        switch status {
        case .alive:
            characterStatusLabel.textColor = .green
        case .dead:
            characterStatusLabel.textColor = .red
        case .unknown:
            characterStatusLabel.textColor = .orange
        }
    }
}
