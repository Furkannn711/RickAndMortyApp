//
//  MainVC.swift
//  RickAndMortyApp
//
//  Created by furkan on 16.02.2024.
//

import UIKit

final class MainVC: UIViewController {

    @IBOutlet private weak var characterTableView: UITableView!
    var viewModel = MainVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        viewModel.delegate = self
        fetchData()
    }
    
    private func registerTableViewCell() {
        let locationCellName = String(describing: LocationCollectionCell.self)
        let locationCellNib = UINib(nibName: locationCellName, bundle: .main)
        characterTableView.register(locationCellNib, forCellReuseIdentifier: locationCellName)
        
        let characterItemCellName = String(describing: CharaterItemCell.self)
        let characterItemCellNib = UINib(nibName: characterItemCellName, bundle: .main)
        characterTableView.register(characterItemCellNib, forCellReuseIdentifier: characterItemCellName)
    }
    
    private func fetchData() {
//        viewModel.fetchCharacter()
        viewModel.fetchLocations()
    }
}

extension MainVC: UITableViewDataSource {
    //sectionların sayısı
    func numberOfSections(in tableView: UITableView) -> Int { viewModel.mainCellTypes.count }
    
    //Section içindeki hücrelerin sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - section'lar switch case olmalı.
        switch viewModel.mainCellTypes[section] {
        case .location:
            return 1
        case .character:
            return viewModel.characterListCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.mainCellTypes[indexPath.section] {
        case .location:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LocationCollectionCell.self)) as? LocationCollectionCell {
                cell.delegate = self
                cell.prepareCell(with: viewModel.locationList)
                return cell
            }
        case .character:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CharaterItemCell.self)) as? CharaterItemCell {
                let vm = CharacterItemCellVM(characterItem: viewModel.characterList[indexPath.row])
                cell.prepareCell(with: vm)
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case .character = viewModel.mainCellTypes[indexPath.section] {
            let lastCharacter = viewModel.characterList.count - 1
            if indexPath.row == lastCharacter {
//                viewModel.fetchCharacter()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        let detailVM = DetailVM(characterResponse: viewModel.characterList[indexPath.row])
        detailVC.viewModel = detailVM
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MainVC: MainVMDelegate {
    func notify(_ notfiy: MainVMNotify) {
        switch notfiy {
        case .characterReloadData:
            characterTableView.reloadSections([1], with: .none)
        case .locationReloadData:
            viewModel.fetchCharacter(character: viewModel.locationList.first?.residents ?? [])
            characterTableView.reloadData()
        }
    }
}

extension MainVC: LocationCollectionCellDelegate {
    func didDisplayLastLocation() {
        viewModel.fetchLocations()
    }
    
    func didSelectLocation(with url: [URL]) {
        viewModel.fetchCharacter(character: url)
    }
}
