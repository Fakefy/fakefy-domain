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
                // TODO: Test object mapping
            }
        }
    }
}

// MARK: - Test Implementation
extension SearchNetworkSpec {
    
    func searchSuccess() {
        let mockData = Mock.dataFromJson(named: "search-success")
        let mock = Mock.mock(api: ApiReference.Search.search, status: 200, data: mockData)
        let network = NetworkFactory.getSearchNetwork(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)

        waitUntil(timeout: .seconds(10)) { done in
            network.search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") { searchResult in
                switch searchResult {
                case .success(let searchData):
                    expect(searchData).notTo(beEmpty())
                    done()
                case .failure(let error):
                    fail("Must be a success response! \(String(describing: error.moyaError))")
                    done()
                }
            }
        }
    }
    
    func searchFailure() {
        let mock = Mock.mock(api: ApiReference.Search.search, status: 401, data: Data())
        let network = NetworkFactory.getSearchNetwork(endpointClosure: mock, stubClosure: MoyaProvider<SearchAPI>.immediatelyStub)

        waitUntil(timeout: .seconds(10)) { done in
            network.search(term: "Queen", country: "US", media: "music", entity: "album", attribute: "artistTerm") { searchResult in
                switch searchResult {
                case .success(let searchData):
                    expect(searchData).notTo(beEmpty())
                    done()
                case .failure(let error):
                    expect(error.moyaError?.response?.statusCode).to(equal(401))
                    expect(error.type).to(equal(.generic))
                    done()
                }
            }
        }
    }
}
