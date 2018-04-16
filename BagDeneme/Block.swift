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
    var index: Int?
    var timestamp: Date?
    var data: String?
    var previousHash: String?
    var hash: String?
    var nonce = 0
    
    init(time: Date?, data: String?) {
        self.timestamp = time
        self.data = data
    }
    
    init(index: Int?, time: Date?, data: String?, previous: String?) {
        self.timestamp = time
        self.data = data
        self.index = index
        self.previousHash = previous
        self.hash = self.calculateHash()
    }
    
    func calculateHash() -> String {
        let hashableString = "\(String(describing: self.index))" + "\(String(describing: self.timestamp))" + self.data! + self.previousHash! + "\(self.nonce)"
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
