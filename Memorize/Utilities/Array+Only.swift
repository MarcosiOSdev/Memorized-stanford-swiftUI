//
//  Array+Only.swift
//  Memorize
//
//  Created by Marcos Felipe Souza on 04/06/20.
//  Copyright © 2020 Marcos Felipe Souza. All rights reserved.
//

import Foundation

extension Array {    
    var only: Element? {
        count == 1 ? first : nil
    }
}
