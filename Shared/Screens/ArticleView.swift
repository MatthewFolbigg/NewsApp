//
//  ArticleView.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//

import SwiftUI

struct ArticleView: View {
    
    @State var article: GuardianArticle
    @State var vm: NewsArticles
    
    var body: some View {
        ScrollView {
            AsyncArticleImage(url: article.additional?.thumbnailURL ?? "")
                .frame(minHeight: 80, maxHeight: 400)
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.system(.title, design: .serif))
                ArticleTagBar(article: article)
                Divider()
                
                Text(article.attributedBody)
                    .font(.system(.body, design: .serif))
                    
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: GuardianArticle.testData, vm: NewsArticles(service: GuardianLocalTestService()))
    }
}
