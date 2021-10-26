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

import UIKit

class SearchDatabaseSpec: QuickSpec {
    override func spec() {
        describe("search databse") {
            context("should save") {
                fit("successfully") {
                    self.saveSuccess()
                }
                it("failing") {
                    self.saveFailure()
                }
            }
            context("should load") {
                it("successfully") {
                    self.loadSuccess()
                }
                it("failing") {
                    self.loadFailure()
                }
            }
        }
    }
}

// MARK: - Test Implementaiton
extension SearchDatabaseSpec {
    
    // MARK: - Save
    func saveSuccess() {
        // GIVEN
        let container = TestCoreDataStack.init().container
        let context = container.viewContext
        
        let newItem = SearchResultMO(context: context)
        newItem.name = "First item"
        
        // WHEN
        try! context.save()
        
        // THEN
        
//        let result = try! context.execute(request)// as? [SearchResultMO]
        
//        expect(result).notTo(beNil())
//        expect(result).notTo(beEmpty())
//        expect(result?.count).to(equal(1))
//        expect(result?.first?.name).to(equal("batatinhaFrita"))
    }
    
    func saveFailure() {
        
    }
    
    // MARK: - Load
    func loadSuccess() {
        
    }
    
    func loadFailure() {
        
    }
}
