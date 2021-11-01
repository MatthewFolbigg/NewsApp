//
//  GuardianArticle+.swift
//  NewsApp (iOS)
//
//  Created by Matthew Folbigg on 01/10/2021.
//

import Foundation

extension GuardianArticle {
    //Seperated as uses components not available to NewsAppWidget
    var styledHTML: GuardianArticleHTML { GuardianArticleHTML(bodyHtml: self.additional?.bodyHtml ?? "") }
}
