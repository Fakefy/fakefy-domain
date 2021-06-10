//
//  BusinessFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

class BusinessFactory {
    public static func getSearchBusiness() -> SearchBusinessProtocol {
        let network = NetworkFactory.getSearchNetwork()
        return SearchBusiness(searchNetwork: network)
    }
}
