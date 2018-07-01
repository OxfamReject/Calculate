//
//  CalculatorLogic.swift
//  Let's Calculate!
//
//  Created by Jo Thorpe on 17/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import Foundation

enum Symbol:String {
    case add = "+"
    case minus = "-"
    case none = "none"
}

enum SymbolError:Error {
    case InvalidSymbol
}

