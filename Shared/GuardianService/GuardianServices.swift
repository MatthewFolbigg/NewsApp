//
//  GuardianServices.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import Foundation

//https://content.guardianapis.com/search?order-by=newest&show-elements=all&show-fields=thumbnail&api-key=b4e9c398-1585-4c56-bf39-54b5852c2931

protocol GuardianServiceClient {
    func fetchNewsArtcles(endpoint: GuardianConstants.Endpoint) async throws -> [GuardianArticle]
}

struct GuardianArticlesService: GuardianServiceClient {
    func fetchNewsArtcles(endpoint: GuardianConstants.Endpoint) async throws -> [GuardianArticle] {
        print("Fetching From: \(endpoint.url)")
        let session = URLSession.shared
        let (data, _) = try await session.data(from: endpoint.url)
        return try JSONDecoder().decode(GuardianResponse.self, from: data).response.results
    }
}

struct GuardianLocalTestService: GuardianServiceClient {
    func fetchNewsArtcles(endpoint: GuardianConstants.Endpoint = .section(.technology)) async throws -> [GuardianArticle] {
        return [ GuardianArticle.testData ]
    }
}
