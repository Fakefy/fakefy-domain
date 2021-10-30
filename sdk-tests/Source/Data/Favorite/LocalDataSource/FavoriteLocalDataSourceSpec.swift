//
//  FavoriteLocalDataSourceSpec.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 19/10/21.
//

@testable import TouchTunes_SDK

import Nimble
import Quick
import CoreData

class FavoriteLocalDataSourceSpec: QuickSpec {
    override func spec() {
        describe("favorite local data source") {
            context("saving") {
                it("and returning success") {
                    self.savingAndReturningSuccess()
                }
                it("and returning failure") {
                    self.savingAndReturningFailure()
                }
            }
            context("loading") {
                it("and returning success") {
                    self.loadingAndReturningSuccess()
                }
                it("and returning failure") {
                    self.loadingAndReturningFailure()
                }
            }
        }
    }
}

// MARK: - Implementaiton
extension FavoriteLocalDataSourceSpec {
    
    // MARK: - Save
    func savingAndReturningSuccess() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.newBackgroundContext()
        let fetchRequest = AlbumMO.fetchRequest()
        let newItem = AlbumMO(context: context)
        newItem.name = "batatinhaFrita"
                
        // WHEN
        try! context.save()
        
        // THEN
        let result: [AlbumMO] = try! context.fetch(fetchRequest)

        expect(result).notTo(beNil())
        expect(result).notTo(beEmpty())
        expect(result.count).to(equal(1))
        expect(result.first?.name).to(equal("batatinhaFrita"))
    }
    
    func savingAndReturningFailure() {
        fail("Not implemented")
    }
    
    // MARK: - Load
    func loadingAndReturningSuccess() {
        fail("Not implemented")
    }
    
    func loadingAndReturningFailure() {
        fail("Not implemented")
    }
}
