//
//  LocationItemCell.swift
//  RickAndMortyApp
//
//  Created by furkan on 20.02.2024.
//

import UIKit

final class LocationItemCell: UICollectionViewCell {

    @IBOutlet private weak var locationNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? .red : .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func selectAnimation() {
    }
    
    func prepareCell(wit model: LocationResultResponse, indexPath:IndexPath) {
        locationNameLabel.text = model.name
    }
}
