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
                it("mapping successfully") {
                    self.searchMappingSuccessfully()
                }
            }
        }
    }
}

// MARK: - Test Implementation
extension SearchNetworkSpec {
    
    // TODO: Implement local request
    func searchSuccess() {
        
        let network = NetworkFactory.getSearchNetwork()
        
        waitUntil(timeout: DispatchTimeInterval.seconds(10)) { done in
            network.search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") { searchResult in
                switch searchResult {
                case .success(let searchData):
                    expect(searchData).notTo(beEmpty())
                    done()
                case .failure:
                    fail("Must be a success response!")
                    done()
                }
            }
        }
    }
    
    func searchFailure() {
        fail("Not implemented!")
    }
    
    func searchMappingSuccessfully() {
        fail("Not implemented!")
    }
}
