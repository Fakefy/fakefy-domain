//
//  SearchNetworkSpec.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Nimble
import Quick
import Moya

@testable import TouchTunes_SDK

class SearchNetworkSpec: QuickSpec {
    override func spec() {
        describe("search network") {
            context("should search") {
                it("successfully") {
                    self.searchSuccess()
                }
                it("failing") {
                    self.searchFailure()
                }
            }
        }
    }
}

// MARK: - Test Implementation
extension SearchNetworkSpec {
    
    func searchSuccess() {
        
        // Given
        let mockData = Mock.dataFromJson(named: "search-success")
        let mock = Mock.mock(api: ApiReference.Search.search, status: 200, data: mockData)
        let network = NetworkFactory.getSearchNetwork(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)
        let expectation = expectation(description: "network-expectation")
        var result: Result<[SearchResult], ITunesError>?
        
        // When
        network.search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        expect(result).to(beSuccess { searchResults in
            expect(searchResults.count).to(equal(1))
        })
    }
    
    func searchFailure() {
        
        // Given
        let mock = Mock.mock(api: ApiReference.Search.search, status: 401, data: Data())
        let network = NetworkFactory.getSearchNetwork(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)
        let expectation = expectation(description: "network-expectation")
        var result: Result<[SearchResult], ITunesError>?

        // When
        network.search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.generic))
        })
    }
}
