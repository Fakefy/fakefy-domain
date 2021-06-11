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
        let business = BusinessFactory.getSearchBusiness(searchNetwork: MockedSearchNetwork.Success.withData())
        
        waitUntil(timeout: .seconds(10)) { done in
            business.search(term: "", country: "", media: "", entity: "", attribute: "") { result in
                switch result {
                case .success(let searchResult):
                    expect(searchResult).toNot(beEmpty())
                    done()
                    break
                case .failure:
                    fail("Must be a success response!")
                    done()
                }
            }
        }
    }
    
    func searchFailure() {
        let business = BusinessFactory.getSearchBusiness(searchNetwork: MockedSearchNetwork.Failure.withGenericError())
        
        waitUntil(timeout: .seconds(10)) { done in
            business.search(term: "", country: "", media: "", entity: "", attribute: "") { result in
                switch result {
                case .success:
                    fail("Must be a failure response!")
                    done()
                    break
                case .failure(let error):
                    expect(error.type) == .generic
                    done()
                }
            }
        }
    }
}
