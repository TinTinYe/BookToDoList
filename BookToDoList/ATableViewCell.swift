//
//  ATableViewCell.swift
//  BookToDoList
//
//  Created by Yvonne on 2019/12/5.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit

class ATableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bookImageVIew: UIImageView! {
        didSet{
            let bookImageView = UIImageView()
         bookImageView.layer.cornerRadius = 20
            
         bookImageView.clipsToBounds = true
        }
    }

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
layer.cornerRadius = 30
  clipsToBounds = true
        
        // Configure the view for the selected
}
}
