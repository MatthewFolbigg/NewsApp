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
//            AsyncArticleImage(url: article.additional?.thumbnailURL ?? "")
//                .frame(minHeight: 80, maxHeight: 400)
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title)
                    .font(.system(.title, design: .serif))
                ArticleTagBar(article: article)
                Color.clear.frame(height: 1)
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.horizontal)
            
            HTMLView(htmlString: article.additional?.bodyHtml ?? "", baseURL: nil)
                .font(.system(.body, design: .serif))
        }
        .navigationBarTitleDisplayMode(.inline)
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
    let navDelegate = navigationDelegate()
    
    //Text
    let bodyFont = "'ui-serif', 'HelveticaNeue'"
    let headingFont = "'ui-rounded', 'HelveticaNeue'"
    let dateTimeFont = "'ui-monospace', 'HelveticaNeue'"
    let bodyFontScale = "100"
    let headingFontScale = "200"
    let dateTimeFontScale = "50"
    let textColor = "black"
    let dateTimeColor = "gray"
    let linkColor = "#007aff"
    
    //Layout
    let margin = "8"
    let cornerRadius = "10"
    
    //Section Colors
    let blockBackgroundColor = "#D3D3D3"
    
    //TODO: Add image caption customisation
    var header: String { """
        <!DOCTYPE html>
        <html>
        <head>
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
        <style>
            * {
                margin-right: \(margin)px !important;
                margin-left: \(margin)px !important;
            }
            
            div {
                margin-right: \(0)px !important;
                margin-left: \(0)px !important;
            }
    
            h1, h2, h3, h4, h5 {
                font-family: \(headingFont);
                font-size: \(headingFontScale);
                color: \(textColor);
            }

            p {
                font-family: \(bodyFont);
                font-size: \(bodyFontScale);
                color: \(textColor);
                margin-right: \(margin)px !important;
                margin-left: \(margin)px !important;
            }
    
            a {
                color: \(linkColor);
            }
    
            img {
                display: block;
                margin-left: auto;
                margin-right: auto;
                border-radius: \(cornerRadius)px;
                max-width: 100%;
                height: auto;
            }
    
            .block-elements {
                border-radius: 25px;
                background: \(blockBackgroundColor);
                padding: 20px;
            }
    
            .block-time {
                font-family: \(dateTimeFont);
                color: \(dateTimeColor);
                font-size: \(dateTimeFontScale);
                margin-right: \(0)px !important;
                margin-left: \(0)px !important;
            }
    
        </style>
        </head>
        <body>
    """
    }
    
    let footer = """
        </body>
        </html>
    """
    
    var customHTMLString: String {
        header + htmlString + footer
    }
    
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.navigationDelegate = self.navDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.showsHorizontalScrollIndicator = false
        uiView.loadHTMLString(customHTMLString, baseURL: baseURL)
    }
    
    class navigationDelegate: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if navigationAction.navigationType == .linkActivated {
                if let url = navigationAction.request.url {
                    UIApplication.shared.open(url)
                }
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
    }
    
}
