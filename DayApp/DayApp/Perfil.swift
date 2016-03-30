//
//  Perfil.swift
//  DayApp
//
//  Created by Pedro Gomes Branco on 3/30/16.
//  Copyright © 2016 Pedro G. Branco. All rights reserved.
//

import UIKit

class Perfil: UIViewController{
    
    @IBOutlet var background: UIImageView!
    @IBOutlet var foto: UIImageView!
    @IBOutlet var nome: UILabel!
    @IBOutlet var saldo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foto.layer.borderWidth = 1.0
        foto.layer.masksToBounds = false
        foto.layer.borderColor = UIColor.whiteColor().CGColor
        foto.layer.cornerRadius = foto.frame.size.width/2
        foto.clipsToBounds = true
    }
}
