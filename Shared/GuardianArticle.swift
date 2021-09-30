//
//  GuardianArticle.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//

import Foundation

struct GuardianArticle: Codable, Identifiable {
    let id: String
    let type: String
    let sectionID: String
    let sectionName: String
    let publicationDate: String
    let title: String
    let webURLString: String
    let apiURLString: String
    let isHosted: Bool
    let pillarID: String
    let pillarName: String
    let additional: Additional?
    var url: URL? { URL(string: self.webURLString) }
    var styledHTML: GuardianArticleHTML { GuardianArticleHTML(bodyHtml: self.additional?.bodyHtml ?? "") }
    

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case sectionID = "sectionId"
        case sectionName
        case publicationDate = "webPublicationDate"
        case title = "webTitle"
        case webURLString = "webUrl"
        case apiURLString = "apiUrl"
        case isHosted
        case pillarID = "pillarId"
        case pillarName
        case additional = "fields"
    }
    
    var compactDate: String {
        let ISOFormatter = ISO8601DateFormatter()
        let date = ISOFormatter.date(from: self.publicationDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
//        formatter.dateStyle = .short
        return formatter.string(from: date!)
    }
    
    var attributedBody: String {
        let htmlBody = Data(self.additional?.bodyHtml?.utf8 ?? "".utf8)
        let attr = try? NSAttributedString(data: htmlBody, options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ], documentAttributes: nil)
        return attr?.string ?? ""
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
    let bodyHtml: String?
    
    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnail"
        case publication
        case starRating
        case trailText
        case wordcount
        case byline
        case bodyText
        case bodyHtml = "body"
    }
}
