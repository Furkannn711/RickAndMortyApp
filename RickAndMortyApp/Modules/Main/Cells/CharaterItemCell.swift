//
//  CharaterItemCell.swift
//  RickAndMortyApp
//
//  Created by furkan on 16.02.2024.
//

import UIKit
import Kingfisher

final class CharaterItemCell: UITableViewCell {
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterİmage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCell(with model: CharacterItemCellVM) {
        characterNameLabel.text = model.chracterName
    }
}


// coffeImageView?.kf.setImage(with: url)
