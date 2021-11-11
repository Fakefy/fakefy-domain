//
//  Album.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public struct Album: Codable {
    public let wrapperType: String
    public let artistId: Int
    public let collectionId: Int
    public let artistName: String
    public let collectionName: String
    public let collectionCensoredName: String
    public let artistViewUrl: String
    public let collectionViewUrl: String
    public let artworkUrl60: String?
    public let artworkUrl100: String?
    public let collectionPrice: Double
    public let collectionExplicitness: String
    public let trackCount: Int
    public let copyright: String?
    public let releaseDate: String?
    public let country: String
    public let currency: String
    public let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case collectionExplicitness = "collectionExplicitness"
        case trackCount = "trackCount"
        case copyright = "copyright"
        case releaseDate = "releaseDate"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
    }
}
