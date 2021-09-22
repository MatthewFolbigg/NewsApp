//
//  GuardianConstants.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import Foundation

struct GuardianConstants {
    
//https://content.guardianapis.com/search?section=technology&order-by=newest&use-date=published?api-key=b4e9c398-1585-4c56-bf39-54b5852c2931
//https://content.guardianapis.com/search?order-by=newest&api-key=b4e9c398-1585-4c56-bf39-54b5852c2931
//https://content.guardianapis.com/search?page-size=20&api-key=b4e9c398-1585-4c56-bf39-54b5852c2931
    
    private static var searchArticles = "https://content.guardianapis.com/search?"
    private static var orderedByNewsest = "order-by=newest&use-date=published"
    private static var key = "api-key=b4e9c398-1585-4c56-bf39-54b5852c2931"
    private static var includeAdditionalFields = "show-fields=all"
    private static var pageSize = "page-size=20"
    
    enum Section: String, CaseIterable, Identifiable {
        case none
        case artanddesign
        case business
        case technology
        
        var name: String {
            switch self {
            case .none: return "News"
            case .artanddesign: return "Art & Design"
            case .business: return "Business"
            case .technology: return "Technology"
            }
        }
        
        var component: String {
            if self == .none {
                return ""
            } else {
                return "section=\(self.rawValue)"
            }
        }
        
        var id: String { return self.rawValue }
    }
    
    enum Endpoint {
        case section(Section)
        
        var url: URL {
            switch self {
            case .section(let section): return URL(string: searchArticles + section.component + "&" + orderedByNewsest + "&" + pageSize + "&" + includeAdditionalFields + "&" + key)!
            }
        }
    }
}
