//
//  Friend.swift
//  DayApp
//
//  Created by Pedro Gomes Branco on 3/30/16.
//  Copyright © 2016 Pedro G. Branco. All rights reserved.
//

import UIKit

class Friend: UIViewController{
    
    @IBOutlet var background: UIImageView!
    @IBOutlet var foto: UIImageView!
    @IBOutlet var nome: UILabel!
    @IBOutlet var saldo: UILabel!
   
    var imagem: UIImage!
    var name: String!
    var cash: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.image = imagem
        foto.image = imagem
        nome.text = name
        if(Int(cash) < 0){
            saldo.text = "Saldo: - R$ \(Int(cash)! * (-1)),00"
        }
        else{
            saldo.text = "Saldo: + R$ \(cash),00"
        }
        
        foto.layer.borderWidth = 4.0
        foto.layer.masksToBounds = false
        foto.layer.borderColor = UIColor.whiteColor().CGColor
        foto.layer.cornerRadius = foto.frame.size.width/2
        foto.clipsToBounds = true
    }
}
