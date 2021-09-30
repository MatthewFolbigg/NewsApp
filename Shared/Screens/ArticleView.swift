//
//  ArticleView.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 22/09/2021.
//


import WebKit
import SwiftUI

struct ArticleView: View {
    
    @State var article: GuardianArticle
    @State var vm: NewsArticles
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncArticleImage(url: article.additional?.thumbnailURL ?? "")
                .frame(minHeight: showImage ? 80: 0, maxHeight: showImage ? 400: 0)
                .scaleEffect(showImage ? 1 : 0, anchor: .center)
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.system(.title, design: .serif))
                HStack {
                    ArticleTagBar(article: article)
                    imageButton
                        .tagStyle(color: .blue)
                }
                Color.clear.frame(height: 1)
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            
            HTMLView(baseURL: article.url, html: article.styledHTML)
                .font(.system(.body, design: .serif))
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @State var showImage: Bool = false
    var imageButton: some View {
        Image(systemName: "photo")
            .onTapGesture {
                withAnimation {
                    showImage.toggle()
                }
            }
    }
    
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: GuardianArticle.testData, vm: NewsArticles(service: GuardianLocalTestService()))
    }
}
