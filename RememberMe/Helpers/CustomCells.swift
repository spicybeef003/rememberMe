//
//  CustomCellsVC.swift
//  RememberMe
//
//  Created by Tony Jiang on 11/5/18.
//  Copyright © 2018 Tony Jiang. All rights reserved.
//

import UIKit

class PeopleCell: UITableViewCell {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    override func prepareForReuse() {
        profilePic.image = nil
        label1.text = nil
        label2.text = nil
        label3.text = nil
        label4.text = nil
    }

}
