//
//  LocationCollectionCell.swift
//  RickAndMortyApp
//
//  Created by furkan on 20.02.2024.
//

import UIKit

protocol LocationCollectionCellDelegate {
    func didDisplayLastLocation()
    func didSelectLocation(with url: [URL])
}

final class LocationCollectionCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var locationlist: [LocationResultResponse] = []
    var delegate: LocationCollectionCellDelegate?
    var index: Int?
//    var firstIndexPath:IndexPath = [1,0]
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        resgisterCells()
    }
    // index'i buraya gönder.
    func prepareCell(with model: [LocationResultResponse]) {
        self.locationlist.append(contentsOf: model)
        self.collectionView.reloadData()

    }
    
    private func resgisterCells() {
        let locationCellName = String(describing: LocationItemCell.self)
        let locationCellNib = UINib(nibName: locationCellName, bundle: .main)
        collectionView.register(locationCellNib, forCellWithReuseIdentifier: locationCellName)
    }
    
}

extension LocationCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { locationlist.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LocationItemCell.self), for: indexPath) as? LocationItemCell {
            cell.prepareCell(wit: locationlist[indexPath.row], indexPath: indexPath)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension LocationCollectionCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectLocation(with: locationlist[indexPath.row].residents ?? [])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastLocation = locationlist.count - 1
        if indexPath.row == lastLocation {
            delegate?.didDisplayLastLocation()
            
        }
    }
}

