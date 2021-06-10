//
//  SearchNetwork.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

protocol SearchNetworkProtocol {
    func search(term: String,
                country: String,
                media: String,
                entity: String,
                attribute: String,
                callback: @escaping (Result<[SearchResult], ITunesError>) -> Void)
}

class SearchNetwork {
    
    private let provider: MoyaProvider<SearchAPI>
    private let config: ITunesConfig
    
    // MARK: - Inits
    init(provider: MoyaProvider<SearchAPI>, config: ITunesConfig) {
        self.provider = provider
        self.config = config
    }
}

// MARK: - Requests
extension SearchNetwork: SearchNetworkProtocol {
    
    func search(term: String,
                country: String,
                media: String,
                entity: String,
                attribute: String,
                callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) {
        provider.request(SearchAPI.search(term: term,
                                          country: country,
                                          media: media,
                                          entity: entity,
                                          attribute: attribute,
                                          config: config)) {  result in
            switch result {
            case .success(let response):
                do {
                    let model = try response.map(BaseResponse<SearchResult>.self, using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(model.results))
                } catch {
                    callback(.failure(ITunesError.init(type: .encoding)))
                }
            case .failure:
                callback(.failure(ITunesError.init(type: .generic)))
                break
            }
        }
    }
}
