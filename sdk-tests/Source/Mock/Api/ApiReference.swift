//
//  ApiReference.swift
//  TouchTunes SDK Tests
//
//  Created by Ney Moura on 11/06/21.
//

@testable import TouchTunes_SDK

enum ApiReference {
    enum Search {
        static let config = ITunesConfig()
        static let search = SearchAPI.search(term: "", country: "", media: "", entity: "", attribute: "", config: config)
    }
}
