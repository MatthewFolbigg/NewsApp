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
        HStack(alignment: .center) {
            articleImage
            VStack(alignment: .leading, spacing: 2) {
                articleTitles
                tagBar
                .padding(.top)
            }
            Spacer()
        }
        .padding(10)
        .background() {
            rowBackground
        }
    }
    
    //MARK: - Row Style
    var rowBackground: some View {
        Color.gray.opacity(0.2)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    //MARK: - Titles
    var articleTitles: some View {
        Group {
            Text(article.webTitle)
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
        AsyncImage(
            url: URL(string: article.additional?.thumbnailURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                thumbnailPlaceholder
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var thumbnailPlaceholder: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.2)
            Image(systemName: "newspaper")
                .foregroundColor(.secondary)
        }
    }
    
    //MARK: - Tags
    var tagBar: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(vm.compactDate(for: article))
                .font(.caption)
                .modifier(tagStyle())
            Text(article.sectionName)
                .font(.caption)
                .modifier(tagStyle())
        }
    }
}


//MARK: - Tage View Modifier
struct tagStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(3)
            .foregroundColor(.secondary)
            .background(
                Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            )
    }

}




struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: GuardianArticle.testData, vm: NewsArticles(service: GuardianLocalTestService()))
    }
}
