//
//  SearchNetworkMock.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 04/10/21.
//

import Foundation

@testable import TouchTunes_SDK

class SearchNetworkMockImpl: SearchNetwork {
    
    // MARK: - Clojures
    lazy var searchClosure: ((_ term: String, _ country: String, _ media: String, _ entity: String, _ attribute: String, _ callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) -> Void)? = nil
    
    // MARK: - Protocol implementation
    func search(term: String, country: String, media: String, entity: String, attribute: String, callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) {
        searchClosure!(term, country, media, entity, attribute, callback)
    }
}
