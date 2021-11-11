//
//  FavoriteRepository.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 11/11/21.
//

protocol FavoriteRepository {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void)
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void)
}
