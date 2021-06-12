//
//  ITunesError.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

public struct ITunesError: Error {

    enum ErrorType: CaseIterable {
        case generic
        case encoding
    }
    
    let type: ErrorType
    let moyaError: MoyaError?
        
    init(type: ErrorType = .generic, moyaError: MoyaError? = nil) {
        self.type = type
        self.moyaError = moyaError
    }
}
