//
//  ViewController.swift
//  DayApp
//
//  Created by Pedro G. Branco on 3/28/16.
//  Copyright © 2016 Pedro G. Branco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var homeS: UIImageView!
    @IBOutlet var eventoS: UIImageView!
    @IBOutlet var eventos: UIButton!
    @IBOutlet var home: UIButton!
    @IBOutlet var table: UITableView!
    @IBOutlet var statusView: UIView!
    @IBOutlet var barrinhaRec: UIImageView!
    @IBOutlet var barrinhaDev: UIImageView!
    @IBOutlet var barritaTot: UIImageView!
    @IBOutlet var collection: UICollectionView!
    @IBOutlet var receber: UILabel!
    @IBOutlet var deve: UILabel!
    @IBOutlet var total: UILabel!
    
    var tot = 0
    var rec = 0
    var dev = 0
    
    var selected : Usuario!
    
    var pessoas : [Usuario] = [
        Usuario(id: 2,nome: "Pedro Velmovitsky", historico_user: ["Isabella Slawka": "-100", "Pedro Gomes": "-20", "Pedro de Sá": "-20", "Rebeca Marques": "45", "Isabelle Pencack": "-30", "Sofia Insua": "-40", "Maysa Tauk": "-40"], foto: UIImage(named:"pedro_v.jpg" )!),
        Usuario(id: 3,nome: "Pedro Gomes", historico_user: ["Isabella Slawka": "-30", "Pedro Velmovitsky": "20", "Rebeca Marques": "55", "Isabelle Pencack": "30", "Sofia Insua": "-40", "Maysa Tauk": "-30"], foto: UIImage(named:"pedro_g.jpg" )!),
        Usuario(id: 4,nome: "Pedro De Sá", historico_user: ["Isabella Slawka": "45", "Pedro Velmovitsky": "20", "Karen Mann": "-30", "Isabelle Pencack": "25"], foto: UIImage(named:"pedro_s.jpg" )!),
        Usuario(id: 5,nome: "Karen Mann", historico_user: ["Isabella Slawka": "20", "Pedro de Sá": "30", "Rebeca Marques": "70", "Sofia Insua": "-45"], foto: UIImage(named:"karen.jpg" )!),
        Usuario(id: 6, nome: "Rebeca Marques", historico_user: ["Pedro Velmovitsky": "-45", "Pedro Gomes": "-55", "Isabelle Pencack:": "60", "Karen Mann": "-70", "Isabella Slawka": "-20", "Sofia Insua": "25", "Maysa Tauk": "35"], foto: UIImage(named:"rebeca.jpg")!),
        Usuario(id:7, nome: "Isabelle Pencack", historico_user: ["Rebeca Marques": "-60", "Pedro Gomes": "-30", "Pedro de Sá": "-25", "Pedro Velmovitsky": "30", "Isabelle Penckack": "40", "Isabella Slawka": "-80"], foto: UIImage(named: "isabelle.jpg")!),
        Usuario(id: 8, nome: "Sofia Insua", historico_user: ["Isabella Slawka": "30", "Pedro Velmovitsky": "40", "Rebeca Marques": "-25", "Pedro Gomes": "40", "Karen Mann": "45"], foto: UIImage(named: "sofia.jpg")!),
        Usuario(id: 9, nome: "Maysa Tauk", historico_user: ["Isabella Slawka": "30", "Pedro Velmovitsky": "40", "Rebeca Marques": "-25", "Pedro Gomes": "30"], foto: UIImage(named: "maysa.jpg")!)]
    
    var pessoasDev = [Usuario]()
    var pessoasRec = [Usuario]()
    var pessoasTot = [Usuario]()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.hidden = true
        
        homeS.hidden = false
        eventoS.hidden = true
        
        pessoasTot = pessoas

        for p in 0...pessoas.count-1{
            let t = Int(pessoas[p].historico_user["Isabella Slawka"]!)
            if(t < 0){
                dev = dev + t!*(-1)
            }
            else{
                rec = rec + t!
            }
        }
        
        for i in 0...pessoasTot.count-1{
            let j = Int(pessoasTot[i].historico_user["Isabella Slawka"]!)
            if(j>0){
                pessoasRec.append(pessoasTot[i])
            }
        }
        
        for i in 0...pessoasTot.count-1{
            let j = Int(pessoasTot[i].historico_user["Isabella Slawka"]!)
            if(j<0){
                pessoasDev.append(pessoasTot[i])
            }
        }
        
        statusView.layer.shadowColor = UIColor.blackColor().CGColor
        statusView.layer.shadowOffset = CGSizeMake(0, 1)
        statusView.layer.shadowOpacity = 1
        statusView.layer.shadowRadius = 1
        statusView.clipsToBounds = false
        statusView.layer.masksToBounds = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pessoas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Cell
        cell.image.image = pessoas[indexPath.item].foto
        cell.name.text = pessoas[indexPath.item].nome
        
        let i = Int(pessoas[indexPath.item].historico_user["Isabella Slawka"]!)
        
        if(i < 0){
            cell.cash.text = "- R$ \(Int(pessoas[indexPath.item].historico_user["Isabella Slawka"]!)! * -1),00"
            cell.cash.backgroundColor = UIColor(red: 230/255, green: 60/255, blue: 0/255, alpha: 1.0)
        }
        else{
            cell.cash.text = "+ R$ \(pessoas[indexPath.item].historico_user["Isabella Slawka"]!),00"
            cell.cash.backgroundColor = UIColor(red: 56/255, green: 180/255, blue: 73/255, alpha: 1.0)
        }
    
        tot = rec - dev
        deve.text = "R$ \(dev),00"
        receber.text = "R$ \(rec),00"
        if(tot > 0){
            total.text = "+ R$ \(tot),00"
        }
        else{
            total.text = "- R$ \((-1) * tot),00"
        }
        
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOffset = CGSizeMake(0, 1)
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 7.0
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
             
        return cell
    }
    
    
    @IBAction func receber(sender: AnyObject) {
        
        barrinhaRec.hidden = false
        barrinhaDev.hidden = true
        barritaTot.hidden = true
        pessoas = pessoasRec
        collection.reloadData()
    }
    
    @IBAction func deve(sender: AnyObject) {
        
        barrinhaRec.hidden = true
        barrinhaDev.hidden = false
        barritaTot.hidden = true
        pessoas = pessoasDev
        collection.reloadData()
    }
    
    @IBAction func total(sender: AnyObject) {
        
        barrinhaRec.hidden = true
        barrinhaDev.hidden = true
        barritaTot.hidden = false
        pessoas = pessoasTot
        collection.reloadData()
    }
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selected = pessoas[indexPath.row]
        self.performSegueWithIdentifier("friend", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "friend"){
            let vc = segue.destinationViewController as! Friend
            vc.imagem = selected.foto
            vc.name = selected.nome
            vc.cash = selected.historico_user["Isabella Slawka"]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pessoas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ola") as! CelulaTable
        cell.nome.text = pessoas[indexPath.row].nome
        return cell
    }
    
    @IBAction func eventos(sender: AnyObject) {
        collection.hidden = true
        statusView.hidden = true
        table.hidden = false
        homeS.hidden = true
        eventoS.hidden = false
    }
    
    @IBAction func home(sender: AnyObject) {
        collection.hidden = false
        statusView.hidden = false
        table.hidden = true
        homeS.hidden = false
        eventoS.hidden = true
    }
}

