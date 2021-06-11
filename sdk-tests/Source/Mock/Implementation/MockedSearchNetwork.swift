//
//  MockedSearchNetwork.swift
//  TouchTunes SDK Tests
//
//  Created by Ney Moura on 11/06/21.
//

import Foundation

@testable import TouchTunes_SDK

enum MockedSearchNetwork {
    enum Success {
        static func withData() -> SearchNetworkProtocol {
            class SearchSuccessNetwork: SearchNetworkProtocol {
                func search(term: String, country: String, media: String, entity: String, attribute: String, callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) {
                    let mockData = Mock.dataFromJson(named: "search-success")
                    let results = try! JSONDecoder().decode(BaseResponse<SearchResult>.self, from: mockData)
                    let result = Result<[SearchResult], ITunesError>.success(results.results)
                    callback(result)
                }
            }
            return SearchSuccessNetwork()
        }
    }
    
    enum Failure {
        static func withGenericError() -> SearchNetworkProtocol {
            class SearchFailureNetwork: SearchNetworkProtocol {
                func search(term: String, country: String, media: String, entity: String, attribute: String, callback: @escaping (Result<[SearchResult], ITunesError>) -> Void) {
                    let result = Result<[SearchResult], ITunesError>.failure(ITunesError.init(type: .generic))
                    callback(result)
                }
            }
            return SearchFailureNetwork()
        }
    }
}
