//
//  Block.swift
//  BagDeneme
//
//  Created by Barış Uyar on 15.04.2018.
//  Copyright © 2018 Barış Uyar. All rights reserved.
//

import Foundation
import CryptoSwift

class Block {
    var timestamp: Date?
    var transactions: [Transaction]?
    var previousHash: String?
    var hash: String?
    var nonce = 0
    
    init(time: Date?, transactions: [Transaction]?) {
        self.timestamp = time
        self.transactions = transactions
    }
    
    init(time: Date?, transactions: [Transaction]?, previous: String?) {
        self.timestamp = time
        self.transactions = transactions
        self.previousHash = previous
        self.hash = self.calculateHash()
    }
    
    func calculateHash() -> String {
        var hashableString = "\(String(describing: self.timestamp))" + self.previousHash! + "\(self.nonce)"
        for transaction in self.transactions! {
            if let fromAddress = transaction.fromAddress {
                hashableString = hashableString + fromAddress
            }
            if let toAddress = transaction.toAddress {
                hashableString = hashableString + toAddress
            }
            if let amount = transaction.amount {
                hashableString = hashableString + "\(amount)"
            }
        }
        return hashableString.sha256()
    }
    
    func mineBlock(difficulty: Int) {
        while self.hash?.subString(start: 0, end: difficulty) !=  "".padding(toLength: difficulty, withPad: "0", startingAt: 0){
            self.nonce = self.nonce + 1
            self.hash = self.calculateHash()
        }
        
        print("Block mined: \(String(describing: self.hash))")
    }
}
