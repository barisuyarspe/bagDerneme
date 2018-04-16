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
    var pendingTransactions = [Transaction]()
    var miningReward = Int()
    
    init() {
        self.chain.append(createGenesisBlock())
        self.difficulty = 2
        self.pendingTransactions = []
        self.miningReward = 100
    }
    
    func createGenesisBlock() -> Block
    {
        return Block(time: Date(), transactions: [], previous: "")
    }
    
    func getLatestBlock() -> Block {
        return self.chain.last!
    }
    
    func addBlock(block: Block) {
        block.previousHash = self.getLatestBlock().hash
        block.mineBlock(difficulty: self.difficulty)
        self.chain.append(block)
    }
    
    func minePendingTransactions(miningRewardAddress: String?) {
        let block = Block(time: Date(), transactions: self.pendingTransactions, previous: self.getLatestBlock().hash)
        block.mineBlock(difficulty: self.difficulty)
        print("Block successfully mined")
        self.chain.append(block)
        
        self.pendingTransactions = [
            Transaction(fromAddress: nil, toAddress: miningRewardAddress, amount: self.miningReward)
        ]
    }
    
    func createTransaction(transaction: Transaction) {
        self.pendingTransactions.append(transaction)
    }
    
    func getBalanceOfAddress(address: String?) -> Int{
        var balance = 0
        
        for block in self.chain {
            for transaction in block.transactions! {
                if transaction.fromAddress == address {
                    balance = balance - transaction.amount!
                }
                
                if transaction.toAddress == address {
                    balance = balance + transaction.amount!
                }
            }
        }
        
        return balance
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
