//
//  HTMLView.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 01/10/2021.
//

import SwiftUI
import WebKit

protocol StyleableHTML {
    var header: String { get }
    var footer: String { get }
    var bodyHtml: String { get }
}
extension StyleableHTML {
    var styled: String { header + bodyHtml + footer}
}

struct HTMLView : UIViewRepresentable {
    
    let baseURL: URL?
    let navDelegate = navigationDelegate()
    
    var html: StyleableHTML
    
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.scrollView.insetsLayoutMarginsFromSafeArea = true
        webView.navigationDelegate = self.navDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(html.styled, baseURL: baseURL)
        uiView.scrollView.showsHorizontalScrollIndicator = false
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
