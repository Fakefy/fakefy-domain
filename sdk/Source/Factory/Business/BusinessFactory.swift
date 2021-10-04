//
//  BusinessFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

class BusinessFactory {
    public static func getSearchBusiness(searchNetwork: SearchNetwork = NetworkFactory.getSearchNetwork()) -> SearchBusiness {
        return SearchBusinessImplementation(searchNetwork: searchNetwork)
    }
}
