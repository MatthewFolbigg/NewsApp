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
//        ScrollView {
//            AsyncArticleImage(url: article.additional?.thumbnailURL ?? "")
//                .frame(minHeight: 80, maxHeight: 400)
//            VStack(alignment: .leading, spacing: 10) {
//                Text(article.title)
//                    .font(.system(.title, design: .serif))
//                ArticleTagBar(article: article)
//                Divider()
//
//                Text(article.attributedBody)
//                    .font(.system(.body, design: .serif))
//
//            }
//            .padding(.horizontal)
//        }
//        .navigationBarTitleDisplayMode(.inline)
//    }
        
//        WebView(request: URLRequest(url: article.url!))
        //TODO: Add base URL
        HTMLView(htmlString: article.additional?.bodyHtml ?? "", baseURL: nil)
            .font(.system(.body, design: .serif))
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: GuardianArticle.testData, vm: NewsArticles(service: GuardianLocalTestService()))
    }
}





struct HTMLView : UIViewRepresentable {
    
    let htmlString : String
    let baseURL: URL?
    
    //TODO: font and size currently not working as expected
    let header = """
        <!DOCTYPE html>
        <html>
        <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>
        <style>
            p {
                font-family: -apple-system-ui-serif;
                font-size: 130%;
            }
        </style>
        </head>
        <body>
    """
    
    let footer = """
        </body>
        </html>
    """
    
    
    var customHTMLString: String {
//        "<p style=\"font-family:-apple-system-ui-serif;font-size:100px\">" + htmlString + "</p>"
        header + htmlString + footer
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.showsHorizontalScrollIndicator = false
        uiView.loadHTMLString(customHTMLString, baseURL: baseURL)
    }
    
}
