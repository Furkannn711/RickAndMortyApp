//
//  DetailVC.swift
//  RickAndMortyApp
//
//  Created by furkan on 2.03.2024.
//

import UIKit

final class DetailVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var viewModel: DetailVM? // nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.characterResponse?.name ?? ""
        registerCells()
    }
    
    private func registerCells() {
        let characterImageCellName = String(describing: CharacterImageCell.self)
        let characterImageCellNib = UINib(nibName: characterImageCellName, bundle: nil)
        tableView.register(characterImageCellNib, forCellReuseIdentifier: characterImageCellName)
        
        let characterStatusCellName = String(describing: CharacterNameStatusCell.self)
        let characterStatusCellNib = UINib(nibName: characterStatusCellName, bundle: nil)
        tableView.register(characterStatusCellNib, forCellReuseIdentifier: characterStatusCellName)
    }
}

extension DetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let type = viewModel?.tableViewType else { return 0 }
        return type.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = viewModel?.tableViewType[section] else { return 0 }
        switch type {
        case .characterImage, .characterNameStatus:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = viewModel?.tableViewType[indexPath.section] else { return UITableViewCell() }
        switch type {
        case .characterImage:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterImageCell.self)) as? CharacterImageCell {
                cell.prepareCharacterImageView(with: viewModel?.characterResponse?.image)
                return cell
            }
        case .characterNameStatus:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharacterNameStatusCell.self)) as? CharacterNameStatusCell {
                cell.prepareCharacterStatus(name: viewModel?.characterResponse?.name, status: viewModel?.characterResponse?.status ?? .unknown)
                return cell
            }
        }
        return UITableViewCell()
    }
}
