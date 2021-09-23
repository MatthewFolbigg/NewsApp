//
//  ArticleComponentViews.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//

import SwiftUI

//MARK: - Images
struct ThumbnailPlaceholder: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.2)
            Image(systemName: "newspaper")
                .foregroundColor(.secondary)
        }
    }   
}

struct AsyncArticleImage: View {
    @State var url: String
    var body: some View{
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ThumbnailPlaceholder()
        }
    }
}



//MARK: - MetaData
struct ArticleTagBar: View {
    @State var article: GuardianArticle
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text("\(Image(systemName: "calendar")) \(article.compactDate)")
                .font(.caption)
                .tagStyle()
            Text(article.sectionName)
                .font(.caption)
                .tagStyle()
            if article.additional?.starRating != nil {
                Text("\(Image(systemName: "star.fill")) \(article.additional?.starRating ?? "-")")
                    .font(.caption)
                    .tagStyle()
            }
        }
    }
}
