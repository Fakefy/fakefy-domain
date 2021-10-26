//
//  SearchDatabaseSpec.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 19/10/21.
//

@testable import TouchTunes_SDK

import Nimble
import Quick
import CoreData

class SearchDatabaseSpec: QuickSpec {
    override func spec() {
        describe("search database") {
            context("when saving") {
                fit("a correct object") {
                    self.savingCorrectObject()
                }
                it("a wrong object") {
                    self.saveFailure()
                }
            }
            context("loading") {
                it("a existing object") {
                    self.loadSuccess()
                }
                it("failure") {
                    self.loadFailure()
                }
            }
        }
    }
}

// MARK: - Test Implementaiton
extension SearchDatabaseSpec {
    
    // MARK: - Save
    func savingCorrectObject() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.newBackgroundContext()
        let fetchRequest = SearchResultMO.fetchRequest()
        let newItem = SearchResultMO(context: context)
        newItem.name = "batatinhaFrita"
                
        // WHEN
        try! context.save()
        
        // THEN
        let result: [SearchResultMO] = try! context.fetch(fetchRequest)

        expect(result).notTo(beNil())
        expect(result).notTo(beEmpty())
        expect(result.count).to(equal(1))
        expect(result.first?.name).to(equal("batatinhaFrita"))
    }
    
    func saveFailure() {
        
    }
    
    // MARK: - Load
    func loadSuccess() {
        
    }
    
    func loadFailure() {
        
    }
}
