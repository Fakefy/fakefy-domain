//
//  SearchResult.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public struct SearchResult: Codable {
    public let wrapperType: String
    public let kind: String?
    public let artistID: Int
    public let collectionID: Int
    public let trackID: Int?
    public let artistName: String
    public let collectionName: String
    public let trackName: String?
    public let collectionCensoredName: String
    public let trackCensoredName: String?
    public let artistViewURL: String
    public let collectionViewURL: String
    public let trackViewURL: String?
    public let previewURL: String?
    public let artworkUrl60: String?
    public let artworkUrl100: String?
    public let collectionPrice: Double
    public let trackPrice: Double?
    public let collectionExplicitness: String
    public let trackExplicitness: String?
    public let discCount: Int?
    public let discNumber: Int?
    public let trackCount: Int
    public let trackNumber: Int?
    public let trackTimeMillis: Int?
    public let country: String
    public let currency: String
    public let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
        case kind = "kind"
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case collectionCensoredName = "collectionCensoredName"
        case trackCensoredName = "trackCensoredName"
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case trackPrice = "trackPrice"
        case collectionExplicitness = "collectionExplicitness"
        case trackExplicitness = "trackExplicitness"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case trackCount = "trackCount"
        case trackNumber = "trackNumber"
        case trackTimeMillis = "trackTimeMillis"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
    }
}
