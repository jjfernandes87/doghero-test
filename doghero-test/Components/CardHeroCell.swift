//
//  CardHeroCell.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit

class CardHeroCell: UITableViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var hero: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var neighborhood: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var reserveButton: UIButton!
    
    class func reusableCell() -> String {
        return "CardHeroCell"
    }
    
    /// Style
    override func awakeFromNib() {
        super.awakeFromNib()
        thumb.layer.masksToBounds = true
        thumb.layer.cornerRadius = thumb.frame.width / 2
        thumb.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.66)
        
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.66)
        neighborhood.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.42)
        price.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.66)
        
        chatButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
        chatButton.layer.cornerRadius = 3
        
        reserveButton.backgroundColor = UIColor(red: 247/255, green: 96/255, blue: 69/255, alpha: 1)
        reserveButton.layer.cornerRadius = 3
    }
    
}
