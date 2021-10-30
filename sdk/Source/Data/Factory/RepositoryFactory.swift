//
//  RepositoryFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 30/10/21.
//

class RepositoryFactory {
    static func makeSearchRepository(remoteDataSource: SearchRemoteDataSource = DataSourceFactory.makeSearchRemoteDataSource()) -> SearchRepository {
        return SearchRepositoryImpl(remoteDataSource: remoteDataSource)
    }
}
