//
//  Album.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

public class Album: Codable {
    public let wrapperType: String? = nil
    public let artistId: Int? = nil
    public let collectionId: Int? = nil
    public let artistName: String? = nil
    public let collectionName: String? = nil
    public let collectionCensoredName: String? = nil
    public let artistViewUrl: String? = nil
    public let collectionViewUrl: String? = nil
    public let artworkUrl60: String? = nil
    public let artworkUrl100: String? = nil
    public let collectionPrice: Double? = nil
    public let collectionExplicitness: String? = nil
    public let trackCount: Int? = nil
    public let copyright: String? = nil
    public let releaseDate: String? = nil
    public let country: String? = nil
    public let currency: String? = nil
    public let primaryGenreName: String? = nil

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
