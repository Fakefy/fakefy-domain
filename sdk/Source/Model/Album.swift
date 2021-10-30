//
//  Album.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public struct Album: Codable {
    public let wrapperType: String
    public let artistID: Int
    public let collectionID: Int
    public let artistName: String
    public let collectionName: String
    public let collectionCensoredName: String
    public let artistViewURL: String
    public let collectionViewURL: String
    public let previewURL: String?
    public let artworkUrl60: String?
    public let artworkUrl100: String?
    public let collectionPrice: Double
    public let collectionExplicitness: String
    public let discCount: Int?
    public let discNumber: Int?
    public let trackCount: Int
    public let copyright: String?
    public let releaseDate: String?
    public let country: String
    public let currency: String
    public let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
        case artistID = "artistId"
        case collectionID = "collectionId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case collectionExplicitness = "collectionExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case copyright = "copyright"
        case releaseDate = "releaseDate"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
    }
}
