//
//  NetworkFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

class NetworkFactory {
    static func getSearchNetwork() -> SearchNetworkProtocol {
        let provider = MoyaProvider<SearchAPI>()
        let config = ITunesConfig()
        return SearchNetwork(provider: provider, config: config)
    }
}
