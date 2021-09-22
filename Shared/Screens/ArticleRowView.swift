//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//

import SwiftUI

struct ArticleRowView: View {
    
    @State var article: GuardianArticle
    @StateObject var vm: NewsArticles
    
    var body: some View {
        ZStack() {
            NavigationLink(destination: { ArticleView(article: article, vm: vm) }) {}.opacity(0)
            HStack(alignment: .center) {
                articleImage
                Spacer()
                VStack(alignment: .leading, spacing: 2) {
                    articleTitles
                    ArticleTagBar(article: article)
                        .padding(.top)
                }
                Spacer()
            }
            .padding(10)
            .background() {
                rowBackground
            }
            .padding(.horizontal, 2)
        }
    }
    
    //MARK: - Row Style
    var rowBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.ultraThickMaterial)
            .shadow(color: .primary.opacity(0.2), radius: 2, x: 0, y: 0)
            
    }
    
    //MARK: - Titles
    var articleTitles: some View {
        Group {
            Text(article.title)
                .font(.system(.headline, design: .serif))
                .lineLimit(2)
                .foregroundColor(.primary)
            Text(article.additional?.byline ?? "")
                .font(.system(.caption, design: .serif))
                .lineLimit(1)
                .foregroundColor(.secondary)
        }
    }
    
    //MARK: - Image
    var articleImage: some View {
        AsyncArticleImage(url: article.additional?.thumbnailURL ?? "")
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
}






struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: GuardianArticle.testData, vm: NewsArticles(service: GuardianLocalTestService()))
    }
}
