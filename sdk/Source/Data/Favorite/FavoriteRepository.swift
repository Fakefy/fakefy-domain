//
//  FavoriteRepository.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 01/11/21.
//

protocol FavoriteRepository {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void)
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void)
}

class FavoriteRepositoryImpl {
    
    let localDataSource: FavoriteLocalDataSource
    
    init(localDataSource: FavoriteLocalDataSource) {
        self.localDataSource = localDataSource
    }
}

extension FavoriteRepositoryImpl: FavoriteRepository {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void) {
        localDataSource.saveAlbum(album: album, completion: completion)
    }
    
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void) {
        localDataSource.fetchAlbums(completion: completion)
    }
}
