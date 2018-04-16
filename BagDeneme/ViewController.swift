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
        print(barCoin.isChainValid())
//        barCoin.chain[1].data = "değiştirildi"
//        print(barCoin.isChainValid())
    }

    func createBlockChain() {
        print("first block mining..")
        barCoin.addBlock(block: Block(time: Date(), data: "İkinci"))
        print("second block mining..")
        barCoin.addBlock(block: Block(time: Date(), data: "Üçüncü"))
    }
}

