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
    convenience init(from managed: AlbumMO) {
        self.init()
        Mirror(reflecting: managed).copyAttributes(into: self)
    }
}
