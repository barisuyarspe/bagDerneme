//
//  ViewController.swift
//  BagDeneme
//
//  Created by Barış Uyar on 15.04.2018.
//  Copyright © 2018 Barış Uyar. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {

    let barCoin = Chain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createBlockChain()
        print(barCoin.getBalanceOfAddress(address: "AnaAdres"))
        barCoin.minePendingTransactions(miningRewardAddress: "AnaAdres")
        print(barCoin.getBalanceOfAddress(address: "AnaAdres"))
        barCoin.minePendingTransactions(miningRewardAddress: "AnaAdres")
        print(barCoin.getBalanceOfAddress(address: "AnaAdres"))
        print(barCoin.isChainValid())
        barCoin.minePendingTransactions(miningRewardAddress: "AnaAdres")
        print(barCoin.getBalanceOfAddress(address: "AnaAdres"))
    }

    func createBlockChain() {
        barCoin.createTransaction(transaction: Transaction(fromAddress: "BirinciAdres", toAddress: "İkinciAdres", amount: 5))
        barCoin.createTransaction(transaction: Transaction(fromAddress: "ÜçüncüAdress", toAddress: "BirinciAdres", amount: 3))
        barCoin.minePendingTransactions(miningRewardAddress: "AnaAdres")
    }
}

