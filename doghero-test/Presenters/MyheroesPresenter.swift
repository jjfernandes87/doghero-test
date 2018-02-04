//
//  MyheroesPresenter.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

class MyheroesPresenter: NSObject, GridPresenter {
    
    weak var viewProtocol: GridViewController?
    var interactor = MyHeroesInteractor()
    var heroGroup: HeroGroup?
    
    /// Carrega as informações da presenter e assinatura de tableview
    func didLoad() {
        stylePage()
        signingTableviewDataSource()
    }
    
    /// Faz o chamada na API para carregamento das informações
    func willAppear() {
        interactor.loadMyHeroes { [weak self] (heroGroup) in
            guard let mySelf = self else { return }
            mySelf.heroGroup = heroGroup
            mySelf.loadUI(heroGroup: heroGroup)
        }
    }
    
    /// Atualiza a interface
    ///
    /// - Parameter heroGroup: heroGroup
    func loadUI(heroGroup: HeroGroup?) {
        let isHidden = heroGroup?.favorites.count ?? 0 == 0 && heroGroup?.recents.count ?? 0 == 0
        viewProtocol?.tableview.isHidden = isHidden
        viewProtocol?.tableview.rowHeight = 138
        viewProtocol?.tableview.reloadData()
    }
}

// MARK: - Style page
extension MyheroesPresenter {
    
    /// Ajustes na interface, title, prefersLargeTitles, etc...
    fileprivate func stylePage() {
        guard let view = viewProtocol else { return }
        view.navigationController?.navigationBar.prefersLargeTitles = true
        view.navigationItem.largeTitleDisplayMode = .always
        view.title = "Meus Heróis"
    }
    
    /// Assina o tableview dataSource
    fileprivate func signingTableviewDataSource() {
        guard let view = viewProtocol else { return }
        view.tableview.dataSource = self
    }
    
    /// Retorna o objeto hero
    ///
    /// - Parameter indexPath: indice
    /// - Returns: Hero
    func hero(item indexPath: IndexPath) -> Hero {
        return indexPath.section == 0 ? heroGroup!.recents[indexPath.row] : heroGroup!.favorites[indexPath.row]
    }
    
    /// Ação de favoritar
    ///
    /// - Parameter sender: botão favoritar
    @objc fileprivate func favoriteAction(sender: UIButton) {
        sender.popAnimation()
        sender.isSelected = !sender.isSelected
    }
}

// MARK: - Métodos UITableViewDataSource
extension MyheroesPresenter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? heroGroup?.recents.count ?? 0 : heroGroup?.favorites.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = hero(item: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardHeroCell.reusableCell(), for: indexPath) as! CardHeroCell
        cell.thumb.setImageFrom(url: data.user.imageUrl)
        cell.hero.isHidden = !data.isSuperhero
        cell.title.text = data.user.firstName
        cell.neighborhood.text = data.addressNeighborhood
        cell.price.text = data.price.doubleToCurrencyAndMaximumFractionDigits()
        cell.favoriteButton.set(filled: "icon_heart_filled", unfilled: "icon_heart_unfilled", isSelected: indexPath.section != 0 )
        cell.favoriteButton.addTarget(self, action: #selector(favoriteAction(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Heróis com quem hospedei" : "Heróis favoritos"
    }
    
}
