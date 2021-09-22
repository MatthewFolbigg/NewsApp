//
//  NewsArticles.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import Foundation
import SwiftUI

protocol NewsArticlesViewModel: ObservableObject {
    func getNewsArticles() async
}

@MainActor
class NewsArticles: NewsArticlesViewModel, ObservableObject {
    
    @Published private(set) var articles: [GuardianArticle] = []
    @Published private(set) var section: GuardianConstants.Section = .none
    
    private let service: GuardianServiceClient
    
    init(service: GuardianServiceClient) {
        self.service = service
    }
    
    func set(section: GuardianConstants.Section) {
        let oldSection = self.section
        if oldSection != section {
            self.section = section
            Task(priority: .userInitiated) {
                await getNewsArticles()
            }
            print("Section Changed: \(section)")
        }
    }
    
    func getNewsArticles() async {
        do {
            self.articles = try await service.fetchNewsArtcles(endpoint: .section(self.section))
            print("Done")
        } catch {
            //TODO: Handle Error
            print("Error getting news articles")
            print(error)
        }
    }
    
    func compactDate(for article: GuardianArticle) -> String {
        let ISOFormatter = ISO8601DateFormatter()
        let date = ISOFormatter.date(from: article.webPublicationDate)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date!)
    }
    
    
    
    
}
