//
//  UseCaseFactory.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

class UseCaseFactory {
    public static func makeSearchUseCase(searchRepository: SearchRepository = RepositoryFactory.makeSearchRepository()) -> SearchAlbumUseCase {
        return SearchAlbumUseCaseImpl(searchRepository: searchRepository)
    }
}
