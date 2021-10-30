//
//  SearchRepositoryMock.swift
//  TouchTunes SDK Tests
//
//  Created by Ney Moura on 30/10/21.
//

@testable import TouchTunes_SDK

extension SearchRepository {
    func search<T>(request: SearchRequest, returning: T.Type, callback: @escaping (Result<[T], ITunesError>) -> Void) where T: Codable {}
}
