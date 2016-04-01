//
//  SelectFriends.swift
//  DayApp
//
//  Created by Pedro Gomes Branco on 3/31/16.
//  Copyright © 2016 Pedro G. Branco. All rights reserved.
//

import UIKit

class SelectFriend: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate{
    
    @IBOutlet var collection: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    
    var searchActive : Bool = false
    var filtered:[Usuario] = []
    
    var pessoas : [Usuario] = [
        Usuario(id: 2,nome: "Pedro Velmovitsky", historico_user: ["Isabella Slawka": "-100", "Pedro Gomes": "-20", "Pedro de Sá": "-20", "Rebeca Marques": "45", "Isabelle Pencack": "-30", "Sofia Insua": "-40", "Maysa Tauk": "-40"], foto: UIImage(named:"pedro_v.jpg" )!),
        Usuario(id: 3,nome: "Pedro Gomes", historico_user: ["Isabella Slawka": "-30", "Pedro Velmovitsky": "20", "Rebeca Marques": "55", "Isabelle Pencack": "30", "Sofia Insua": "-40", "Maysa Tauk": "-30"], foto: UIImage(named:"pedro_g.jpg" )!),
        Usuario(id: 4,nome: "Pedro De Sá", historico_user: ["Isabella Slawka": "45", "Pedro Velmovitsky": "20", "Karen Mann": "-30", "Isabelle Pencack": "25"], foto: UIImage(named:"pedro_s.jpg" )!),
        Usuario(id: 5,nome: "Karen Mann", historico_user: ["Isabella Slawka": "20", "Pedro de Sá": "30", "Rebeca Marques": "70", "Sofia Insua": "-45"], foto: UIImage(named:"karen.jpg" )!),
        Usuario(id: 6, nome: "Rebeca Marques", historico_user: ["Pedro Velmovitsky": "-45", "Pedro Gomes": "-55", "Isabelle Pencack:": "60", "Karen Mann": "-70", "Isabella Slawka": "-20", "Sofia Insua": "25", "Maysa Tauk": "35"], foto: UIImage(named:"rebeca.jpg")!),
        Usuario(id:7, nome: "Isabelle Pencack", historico_user: ["Rebeca Marques": "-60", "Pedro Gomes": "-30", "Pedro de Sá": "-25", "Pedro Velmovitsky": "30", "Isabelle Penckack": "40", "Isabella Slawka": "-80"], foto: UIImage(named: "isabelle.jpg")!),
        Usuario(id: 8, nome: "Sofia Insua", historico_user: ["Isabella Slawka": "30", "Pedro Velmovitsky": "40", "Rebeca Marques": "-25", "Pedro Gomes": "40", "Karen Mann": "45"], foto: UIImage(named: "sofia.jpg")!),
        Usuario(id: 9, nome: "Maysa Tauk", historico_user: ["Isabella Slawka": "30", "Pedro Velmovitsky": "40", "Rebeca Marques": "-25", "Pedro Gomes": "30"], foto: UIImage(named: "maysa.jpg")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.reloadData()
        self.searchBar.delegate = self
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = pessoas.filter({ (text) -> Bool in
            let tmp: NSString = text.nome
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.collection.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return pessoas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Cell
        
        if(searchActive){
            cell.image.image = filtered[indexPath.item].foto
            cell.name.text = filtered[indexPath.item].nome
        }
        else{
            cell.image.image = pessoas[indexPath.item].foto
            cell.name.text = pessoas[indexPath.item].nome
        }
        
        cell.image.layer.shadowColor = UIColor.blackColor().CGColor
        cell.image.layer.shadowOpacity = 0.5
        cell.image.layer.shadowRadius = 7.0
        cell.image.clipsToBounds = true
        cell.image.layer.borderWidth = 2.0
        cell.image.layer.cornerRadius  = 50
        cell.image.layer.borderColor = UIColor.whiteColor().CGColor
        cell.image.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.cash.text = cell.name.text
        cell.name.hidden = true
        
        return cell
    }
    
    
}