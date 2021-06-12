//
//  SearchBusiness.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public protocol SearchBusinessProtocol {
    func search(term: String, country: String, media: String, entity: String, attribute: String, callback: @escaping (Result<[SearchResult], ITunesError>) -> Void)
}

class SearchBusiness {
    
    private let searchNetwork: SearchNetworkProtocol
    
    init(searchNetwork: SearchNetworkProtocol) {
        self.searchNetwork = searchNetwork
    }
}

// MARK: - Business
extension SearchBusiness: SearchBusinessProtocol {
    func search(term: String, country: String, media: String, entity: String, attribute: String, callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) {
        searchNetwork.search(term: term, country: country, media: media, entity: entity, attribute: attribute, callback: callback)
    }
}
