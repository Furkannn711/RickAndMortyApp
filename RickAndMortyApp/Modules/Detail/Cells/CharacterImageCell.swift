//
//  CharacterImageCell.swift
//  RickAndMortyApp
//
//  Created by furkan on 24.03.2024.
//

import UIKit
import Kingfisher

final class CharacterImageCell: UITableViewCell {
    
    @IBOutlet private weak var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCharacterImageView(with url: URL?) {
        guard let url else { return }
        characterImageView.kf.setImage(with: url)
    }
}
