//
//  MyHeroesInteractor.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

protocol MyHeroesInputData {
    func loadMyHeroes(handler: ((HeroGroup?) -> Void))
}

class MyHeroesInteractor: MyHeroesInputData {
    
    /// Baixa os dados da API
    ///
    /// - Parameter handler: retorna HeroGroup com favoritos e herois
    func loadMyHeroes(handler: ((HeroGroup?) -> Void)) {
        let data = MyHeroes.apiAnswer
        handler(HeroGroup.from(data as NSDictionary))
    }
    
}
