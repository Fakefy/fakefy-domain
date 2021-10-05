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
            let firstResult = searchResults.first
            expect(firstResult).notTo(beNil())
            expect(firstResult!.wrapperType).to(equal("collection"))
            expect(firstResult!.kind).to(beNil())
            expect(firstResult!.artistID).to(equal(3296287))
            expect(firstResult!.collectionID).to(equal(1440650428))
            expect(firstResult!.trackID).to(beNil())
            expect(firstResult!.artistName).to(equal("Queen"))
            expect(firstResult!.collectionName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
            expect(firstResult!.trackName).to(beNil())
            expect(firstResult!.collectionCensoredName).to(equal("The Platinum Collection (Greatest Hits I, II & III)"))
            expect(firstResult!.trackCensoredName).to(beNil())
            expect(firstResult!.artistViewURL).to(equal("https://music.apple.com/us/artist/queen/3296287?uo=4"))
            expect(firstResult!.collectionViewURL).to(equal("https://music.apple.com/us/album/the-platinum-collection-greatest-hits-i-ii-iii/1440650428?uo=4"))
            expect(firstResult!.trackViewURL).to(beNil())
            expect(firstResult!.previewURL).to(beNil())
            expect(firstResult!.artworkUrl60).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/60x60bb.jpg"))
            expect(firstResult!.artworkUrl100).to(equal("https://is3-ssl.mzstatic.com/image/thumb/Music115/v4/83/23/e4/8323e48b-3467-448b-1ce0-8981d8a97437/source/100x100bb.jpg"))
            expect(firstResult!.collectionPrice).to(equal(24.99))
            expect(firstResult!.trackPrice).to(beNil())
            expect(firstResult!.collectionExplicitness).to(equal("notExplicit"))
            expect(firstResult!.trackExplicitness).to(beNil())
            expect(firstResult!.discCount).to(beNil())
            expect(firstResult!.discNumber).to(beNil())
            expect(firstResult!.trackCount).to(equal(51))
            expect(firstResult!.trackNumber).to(beNil())
            expect(firstResult!.trackTimeMillis).to(beNil())
            expect(firstResult!.copyright).to(equal("℗ 2014 Hollywood Records, Inc."))
            expect(firstResult!.releaseDate).to(equal("2014-01-01T08:00:00Z"))
            expect(firstResult!.country).to(equal("USA"))
            expect(firstResult!.currency).to(equal("USD"))
            expect(firstResult!.primaryGenreName).to(equal("Rock"))
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
