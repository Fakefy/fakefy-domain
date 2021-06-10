//
//  ITunesError.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

struct ITunesError: Error {

    enum ErrorType: CaseIterable {
        case generic
        case encoding
    }
    
    let type: ErrorType
    
    init() {
        type = .generic
    }
    
    init(type: ErrorType) {
        self.type = type
    }
}
