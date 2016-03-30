//
//  class_aux.swift
//  Math_DayUtility
//
//  Created by Pedro Velmovitsky on 3/26/16.
//  Copyright © 2016 Pedro Velmovitsky. All rights reserved.
//

import Foundation
import UIKit


class Usuario {
    
    var id: Int
    var nome: String
    var historico_user = [String: String!]()
   // var contactList: Array<Usuario>
   //  var eventos_comparecidos: Array<Evento>
    var totalDebt = 0.0
    var totalCredit = 0.0
    var foto: UIImage
    

    
    
    init(id: Int, nome: String, historico_user: [String: String!], foto: UIImage) {
        
        self.id = id
        self.nome = nome
    //    self.contactList = contactList
    //    self.eventos_comparecidos = eventos_comparecidos
        self.historico_user = historico_user
        self.foto = foto
        
    }
    


// TO-DO: consolidar histórico e checar se essa função fica melhor com o DAO. Checar também melhor maneira de identificar o usuário
    
    func getHistorico (user: Usuario)->Array<Movimentacao> {
     
     var array_movimentos: Array<Movimentacao> = []
     
     for i in 0...historico.movimentacao.count {
     
     
     
     if historico.movimentacao[i].user_1.id == user.id || historico.movimentacao[i].user_2.id == user.id {
            array_movimentos.append(historico.movimentacao[i])
     
            }

        }
        
        return array_movimentos
    }
  
 /* TO-DO: implementar função de evento

    func goEvent (event: Evento) {
        
    }
    
    func createEvent(user: Usuario) -> Evento {
        
    }
 

*/

    
}
 

// user_1 será sempre o que possui uma dívida

class Movimentacao {
    
    var user_1: Usuario
    var user_2: Usuario
    var item: Item
    var valueToPay: Double
    var d1 = 0.0
    var c1 = 0.0
    
    
    init(user_1: Usuario, user_2: Usuario, item: Item, valueToPay: Double, debt: Double) {
        
        self.user_1 = user_1
        self.user_2 = user_2
        self.item = item
        self.valueToPay = valueToPay
        
    }
    
    

    
}

// Singleton para armazenar vetor de movimentações

var historico = Historico()
class Historico {

    static let historico = Historico ()
    
    var movimentacao: Array<Movimentacao> = []
    
    private init() {}
    
}



class Evento {
    
    var id: Int
    var nome: String
    var numero_participantes: Int
    var local: String
    
    init(id: Int, nome: String, numero_participantes: Int, local: String) {
        
        self.id = id
        self.nome = nome
        self.numero_participantes = numero_participantes
        self.local = local
    }
    
//    func update_usuarios(evento: Evento) {
//        
//    }
//    
//    func get_num_usuario(evento: Evento) -> Int {
//        
//    }
    
}

class Conta {
    
    var valor: Double
    
    init(valor: Double) {
        
        self.valor = valor
    }
    
//    func getValor(item: Item, evento: Evento)->Double {
//        
//    }
    
}

class Item {
    
    var conta: Conta
    var user: Usuario
    var valor: Int
    var nome: String
    var local: String
    
    init(conta: Conta, user: Usuario, valor: Int, nome: String, local: String) {
        self.conta = conta
        self.user = user
        self.valor = valor
        self.nome = nome
        self.local = local
    }
    


    
}