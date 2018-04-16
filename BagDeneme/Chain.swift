//
//  Chain.swift
//  BagDeneme
//
//  Created by Barış Uyar on 15.04.2018.
//  Copyright © 2018 Barış Uyar. All rights reserved.
//

import Foundation

class Chain {
    var chain = [Block]()
    var difficulty = Int()
    
    init() {
        self.chain.append(createGenesisBlock())
        self.difficulty = 2
    }
    
    func createGenesisBlock() -> Block
    {
        return Block(index: 0, time: Date(), data: "Genesis Block", previous: "")
    }
    
    func getLatestBlock() -> Block {
        return self.chain.last!
    }
    
    func addBlock(block: Block) {
        block.index = (self.chain.last?.index)! + 1
        block.previousHash = self.getLatestBlock().hash
        block.mineBlock(difficulty: self.difficulty)
        self.chain.append(block)
    }
    
    
    func isChainValid() -> Bool {
        for i in 1...(self.chain.count - 1) {
            let currentBlock = self.chain[i]
            let previousBlock = self.chain[i-1]
            
            if currentBlock.hash != currentBlock.calculateHash() {
                return false
            }
            
            if currentBlock.previousHash != previousBlock.hash {
                return false
            }
        }
        return true
    }
}
