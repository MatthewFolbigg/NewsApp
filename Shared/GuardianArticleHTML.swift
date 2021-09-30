//
//  GuardianArticleHTML.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 01/10/2021.
//

import SwiftUI

struct GuardianArticleHTML: StyleableHTML {
    
    let styles = GuardianArticleHTMLStyles()
    
    var bodyHtml: String
    var header: String { styles.header }
    var footer: String { styles.footer }

}

struct GuardianArticleHTMLStyles {
    
    let bodyFont = "'ui-serif', 'HelveticaNeue'"
    let headingFont = "'ui-rounded', 'HelveticaNeue'"
    let dateTimeFont = "'ui-monospace', 'HelveticaNeue'"
    let bodyFontScale = "100"
    let headingFontScale = "200"
    let dateTimeFontScale = "50"
    let textColor = Color.primary.description
    let dateTimeColor = Color.secondary.description
    let linkColor = Color.blue.description
    
    //Layout
    let margin = "8"
    let cornerRadius = "10"
    
    //Section Colors
    let blockBackgroundColor = Color.gray.description
    
    var header: String {
        """
            <!DOCTYPE html>
            <html>
            <head>
            <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
            <style>
            
                :root {
                    color-scheme: light dark;
                }
            
                body {
                    margin-left: 20px;
                    margin-right: 20px;
                }
            
                h1, h2, h3, h4, h5 {
                    font-family: \(headingFont);
                    font-size: \(headingFontScale);
                    color: \(textColor);
                }
            
                p>strong {
                    color: \(textColor);
                    text-indent: 0 !important;
                }
            
                p {
                    font-family: \(bodyFont);
                    font-size: \(bodyFontScale);
                    color: \(textColor);
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
                }
            
                .block-time {
                    font-family: \(dateTimeFont);
                    color: \(dateTimeColor);
                    font-size: \(dateTimeFontScale);
                    margin-bottom: -5px !important;
                    padding-top: 10px;
                    border-top: 1px;
                    border-top-style: solid;
                    border-color: \(textColor);
                }
            
            </style>
            </head>
            <body>
        """
    }
    
    var footer: String {
        """
            </body>
            </html>
        """
    }
}
