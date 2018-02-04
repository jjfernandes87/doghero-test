//
//  doghero_UnitTests.swift
//  doghero-UnitTests
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import XCTest
@testable import doghero_test

class doghero_UnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - Hero class
extension doghero_UnitTests {
    func testHeroGroup() {
        let data = MyHeroesMock.apiAnswer
        let collection = HeroGroup.from(data as NSDictionary)
        XCTAssertNotNil(collection)
        XCTAssertEqual(collection?.favorites.count, 3, "Quantidade de itens do objeto Hero")
        XCTAssertEqual(collection?.recents.count, 2, "Quantidade de itens do objeto Hero")
    }
    
    func testHeroObj() {
        let data = MyHeroesMock.apiAnswer
        let collection = HeroGroup.from(data as NSDictionary)
        XCTAssertNotNil(collection)
        XCTAssertEqual(collection?.favorites[0].user.firstName, "Cris", "Validando mapeamento")
        XCTAssertEqual(collection?.favorites[0].price, 70, "Validando mapeamento")
    }
}

// MARK: - Double extension
extension doghero_UnitTests {
    func testDoubleExtension() {
        let value:Double = 25
        XCTAssertEqual(value.doubleToCurrencyAndMaximumFractionDigits(), "25", "formatador de moeda")
        XCTAssertEqual(value.doubleToCurrencyAndMaximumFractionDigits(maximumFractionDigits: 2), "25,00", "formatador de moeda com número fracionário")
    }
}

// MARK: - Button extension
extension doghero_UnitTests {
    func testButtonExtension() {
        let button = UIButton()
        button.set(filled: "icon_heart_filled", unfilled: "icon_heart_unfilled")
        XCTAssertEqual(button.currentImage, UIImage(named: "icon_heart_unfilled"), "valida a imagem do botão no estado normal")
    }
    
    func testButtonSelectedExtension() {
        let button = UIButton()
        button.set(filled: "icon_heart_filled", unfilled: "icon_heart_unfilled")
        button.isSelected = true
        XCTAssertEqual(button.currentImage, UIImage(named: "icon_heart_filled"), "valida a imagem do botão no estado selecionado")
    }
}

// MARK: - MyHeroes class
extension doghero_UnitTests {
    func testMyHeroesRecents() {
        let recents = MyHeroesMock.apiAnswer["recents"] as? NSArray
        XCTAssertNotNil(recents)
        XCTAssertEqual(recents?.count, 2, "Quantidade de items")
    }
    
    func testMyHeroesFavorites() {
        let favorites = MyHeroesMock.apiAnswer["favorites"] as? NSArray
        XCTAssertNotNil(favorites)
        XCTAssertEqual(favorites?.count, 3, "Quantidade de items")
    }
}

class MyHeroesMock: MyHeroes {
    
    override class var apiAnswer: [String : Any] {
        
        guard let dictionary = JSONParser.convertToDictionary(self.apiReturnMock) else {
            return [String : Any]()
        }
        
        return dictionary
        
    }
    
    fileprivate class var apiReturnMock: String {
        return "{\"recents\":[{\"is_superhero\":true,\"user\":{\"first_name\":\"Eduardo\",\"image_url\":\"https://doghero-uploads.s3.amazonaws.com/uploads/photo/1433381/sq135_DH_24012018123600937_98895.png\"},\"address_neighborhood\":\"Parque Chacabuco\",\"price\":55},{\"id\":53012,\"is_superhero\":false,\"user\":{\"first_name\":\"Maria\",\"image_url\":\"https://doghero-uploads.s3.amazonaws.com/uploads/photo/764186/sq135_20170404094603_345722_1491353162913.jpg\"},\"address_neighborhood\":\"Aclimação\",\"price\":60}],\"favorites\":[{\"is_superhero\":false,\"user\":{\"first_name\":\"Cris\",\"image_url\":\"https://doghero-uploads.s3.amazonaws.com/uploads/photo/1088842/sq135_20170926010555_270986_1506441955458.jpg\"},\"address_neighborhood\":\"Vila Gomes Cardim\",\"price\":70},{\"is_superhero\":false,\"user\":{\"first_name\":\"Gustavo\",\"image_url\":\"https://doghero-uploads.s3.amazonaws.com/uploads/photo/242781/sq135_Cris_SA-MI.jpg\"},\"address_neighborhood\":\"Vila Mariana\",\"price\":45},{\"is_superhero\":true,\"user\":{\"first_name\":\"Marina\",\"image_url\":\"https://doghero-uploads.s3.amazonaws.com/uploads/photo/1398933/sq135_1516145372035_517808_IMG0535JPG.jpeg\"},\"address_neighborhood\":\"Vila Mariana\",\"price\":65}]}"
    }
    
}


