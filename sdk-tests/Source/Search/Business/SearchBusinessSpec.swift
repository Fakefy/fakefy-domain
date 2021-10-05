//
//  SearchBusinessTest.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Nimble
import Quick

@testable import TouchTunes_SDK

class SearchBusinessSpec: QuickSpec {
    override func spec() {
        describe("search business") {
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
extension SearchBusinessSpec {
    func searchSuccess() {
        
        // Given
        let business = BusinessFactory.getSearchBusiness(searchNetwork: MockedSearchNetwork.Success.withData())
        let expectation = expectation(description: "business-expectation")
        var result: Result<[SearchResult], ITunesError>?
        
        // When
        business.search(term: "", country: "", media: "", entity: "", attribute: "") {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 5)
        
        expect(result).to(beSuccess { searchResult in
            expect(searchResult).notTo(beEmpty())
        })
    }
    
    func searchFailure() {
        
        // Given
        let business = BusinessFactory.getSearchBusiness(searchNetwork: MockedSearchNetwork.Failure.withGenericError())
        let expectation = expectation(description: "business-expectation")
        var result: Result<[SearchResult], ITunesError>?
        
        // When
        business.search(term: "", country: "", media: "", entity: "", attribute: "") {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.generic))
        })
    }
}
