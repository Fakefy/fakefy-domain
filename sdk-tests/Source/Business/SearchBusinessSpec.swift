//
//  SearchBusinessTest.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Nimble
import Quick
import Moya

@testable import TouchTunes_SDK

class SearchBusinessSpec: QuickSpec {
    override func spec() {
        describe("search business") {
            context("should searching") {
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
        fail("Not implemented!")
    }
    
    func searchFailure() {
        fail("Not implemented!")
    }
}
