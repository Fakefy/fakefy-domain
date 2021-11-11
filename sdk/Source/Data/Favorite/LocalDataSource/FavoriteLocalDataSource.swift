//
//  FavoriteLocalDataSource.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 01/11/21.
//

import CoreData

protocol FavoriteLocalDataSource {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void)
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void)
}

class FavoriteLocalDataSourceImpl {
    
    let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
}

extension FavoriteLocalDataSourceImpl: FavoriteLocalDataSource {
    func saveAlbum(album: Album, completion: (Result<Void, ITunesError>) -> Void) {
        do {
            let context = container.newBackgroundContext()
            let albumMO = AlbumMO.init(context: context)
            Mirror(reflecting: album).copyAttributes(into: albumMO)
            
            try context.save()
            completion(.success(Void()))
        } catch {
            completion(.failure(ITunesError(type: .generic)))
        }
    }
    
    func fetchAlbums(completion: (Result<[Album], ITunesError>) -> Void) {
        do {
            let context = container.newBackgroundContext()
            let fetchRequest = AlbumMO.fetchRequest()
            let results = try context.fetch(fetchRequest)
            let albumResults = results.map { Album(from: $0) }
            completion(.success(albumResults))
        } catch {
            completion(.failure(ITunesError(type: .generic)))
        }
    }
}

extension Album {
    init(from managed: AlbumMO) {
        wrapperType = managed.wrapperType ?? "Unkown"
        artistId = Int(managed.artistId)
        collectionId = Int(managed.collectionId)
        artistName = managed.artistName ?? "Unkown"
        collectionName = managed.collectionName ?? "Unkown"
        collectionCensoredName = managed.collectionCensoredName ?? "Unkown"
        artistViewUrl = managed.artistViewUrl ?? "Unkown"
        collectionViewUrl = managed.collectionViewUrl ?? "Unkown"
        artworkUrl60 = managed.artworkUrl60
        artworkUrl100 = managed.artworkUrl100
        collectionPrice = managed.collectionPrice
        collectionExplicitness = managed.collectionExplicitness ?? "Unkown"
        trackCount = Int(managed.trackCount)
        copyright = managed.copyright
        releaseDate = managed.releaseDate
        country = managed.country ?? "Unkown"
        currency = managed.currency ?? "Unkown"
        primaryGenreName = managed.primaryGenreName ?? "Unkown"
    }
}
