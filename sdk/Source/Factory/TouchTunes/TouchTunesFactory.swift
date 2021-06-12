//
//  TouchTunesFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 12/06/21.
//

public class TouchTunesFactory {
    public static func getSearchBusiness() -> SearchBusinessProtocol {
        return BusinessFactory.getSearchBusiness()
    }
}
