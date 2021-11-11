//
//  ITunesError.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public struct ITunesError: Error {

    enum ErrorType: CaseIterable {
        case generic
        case encoding
    }
    
    let type: ErrorType
        
    init(type: ErrorType = .generic) {
        self.type = type
    }
}
