//
//  GuardianResponse.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import Foundation

// MARK: - Response
struct GuardianResponse: Codable {
    let response: Detail
}

struct Detail: Codable {
    let status, userTier: String
    let total, startIndex, pageSize, currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [GuardianArticle]
}

// MARK: - Result
struct GuardianArticle: Codable, Identifiable {
    let id: String
    let type: String
    let sectionID: String
    let sectionName: String
    let webPublicationDate: String
    let webTitle: String
    let webURL: String
    let apiURL: String
    let isHosted: Bool
    let pillarID: String
    let pillarName: String
    let additional: Additional?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case sectionID = "sectionId"
        case sectionName
        case webPublicationDate
        case webTitle
        case webURL = "webUrl"
        case apiURL = "apiUrl"
        case isHosted
        case pillarID = "pillarId"
        case pillarName
        case additional = "fields"
    }
}

struct Additional: Codable {
    let thumbnailURL: String?
    let publication: String?
    let starRating: String?
    let trailText: String?
    let wordcount: String?
    let byline: String?
    let bodyText: String?
    
    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnail"
        case publication
        case starRating
        case trailText
        case wordcount
        case byline
        case bodyText
    }
}

extension GuardianArticle {
    static let testData = GuardianArticle(
        id: "technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-big-update",
        type: "article",
        sectionID: "technology",
        sectionName: "Technology",
        webPublicationDate: "2021-09-20T10:43:47Z",
        webTitle: "iOS 15 release: everything you need to know about Apple’s big update",
        webURL: "https://www.theguardian.com/technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-b",
        apiURL: "https://www.theguardian.com/technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-b",
        isHosted: false,
        pillarID: "pillar/news",
        pillarName: "News",
        additional: Additional(
            thumbnailURL: "https://media.guim.co.uk/6abeaa0f5bd111459cba05797064085bc1b7fe36/1_0_3253_1952/500.jpg",
            publication: "theguardian.com",
            starRating: "4",
            trailText: "Free software upgrades for iPhone, iPad and Watch improve notifications, Safari, FaceTime and more due for release",
            wordcount: "6517",
            byline: "Samuel Gibbs Consumer technology editor",
            bodyText: "Apple plans to release software updates for its iPhone, iPad and smartwatch on Monday, which will add new features for compatible devices. Announced at the firm’s developer conference in June, iOS 15, iPadOS 15 and WatchOS 8 bring new ways to deal with notifications, tools to keep work and home life separate, the ability to FaceTime video call with non-Apple users and more. Here’s what you need to know about the updates. When can I get it? Downloads for iOS, iPadOS and WatchOS updates usually start at about 6pm UK time (1pm in New York; 3am in Sydney). Unlike other manufacturers, all eligible Apple devices will be able to download and install the update the moment it is released rather than in a staggered fashion. Which devices can get it? All Apple smartphones from 2015’s iPhone 6S or newer, including the first-generation iPhone SE, can install iOS 15. All Apple tablets from 2014’s iPad Air 2, 2015’s iPad mini 4, 2017’s iPad 5th Generation or newer can install iPadOS 15. All Apple Watches from the 2017’s Series 3 or newer can install WatchOS 8. How do I get it? Open the Settings app on an iPhone or iPad then navigate to General &gt; Software Update. Tap install if available to download, verify and then reboot to install. You can also install the update via a Mac or iTunes on a Windows computer. WatchOS 8 req..."
        )
    )
}
