//
//  Transaction.swift
//  BagDeneme
//
//  Created by Barış Uyar on 16.04.2018.
//  Copyright © 2018 Barış Uyar. All rights reserved.
//

import Foundation

class Transaction {
    var fromAddress: String?
    var toAddress: String?
    var amount: Int?
    
    init(fromAddress: String?, toAddress: String?, amount: Int?) {
        self.fromAddress = fromAddress
        self.toAddress = toAddress
        self.amount = amount
    }
}
