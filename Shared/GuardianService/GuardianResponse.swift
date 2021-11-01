//
//  GuardianResponse.swift
//  NewsApp
//
//  Created by Matthew Folbigg on 21/09/2021.
//

import Foundation

// MARK: - Response
struct GuardianResponse: Codable {
    let response: Detail
}

struct Detail: Codable {
    let status, userTier: String
    let total, startIndex, pageSize, currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [GuardianArticle]
}


//MARK: - Test Data
extension GuardianArticle {
    static let testData = GuardianArticle(
        id: "technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-big-update",
        type: "article",
        sectionID: "technology",
        sectionName: "Technology",
        publicationDate: "2021-09-20T10:43:47Z",
        title: "iOS 15 release: everything you need to know about Apple’s big update",
        webURLString: "https://www.theguardian.com/technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-b",
        apiURLString: "https://www.theguardian.com/technology/2021/sep/20/ios-15-release-everything-you-need-to-know-about-apples-b",
        isHosted: false,
        pillarID: "pillar/news",
        pillarName: "News",
        additional: Additional(
            thumbnailURL: "https://media.guim.co.uk/6abeaa0f5bd111459cba05797064085bc1b7fe36/1_0_3253_1952/500.jpg",
            publication: "theguardian.com",
            starRating: "4",
            trailText: "Free software upgrades for iPhone, iPad and Watch improve notifications, Safari, FaceTime and more due for release",
            wordcount: "6517",
            byline: "Samuel Gibbs Consumer technology editor",
            bodyText: "Apple plans to release software updates for its iPhone, iPad and smartwatch on Monday, which will add new features for compatible devices. Announced at the firm’s developer conference in June, iOS 15, iPadOS 15 and WatchOS 8 bring new ways to deal with notifications, tools to keep work and home life separate, the ability to FaceTime video call with non-Apple users and more. Here’s what you need to know about the updates. When can I get it? Downloads for iOS, iPadOS and WatchOS updates usually start at about 6pm UK time (1pm in New York; 3am in Sydney). Unlike other manufacturers, all eligible Apple devices will be able to download and install the update the moment it is released rather than in a staggered fashion. Which devices can get it? All Apple smartphones from 2015’s iPhone 6S or newer, including the first-generation iPhone SE, can install iOS 15. All Apple tablets from 2014’s iPad Air 2, 2015’s iPad mini 4, 2017’s iPad 5th Generation or newer can install iPadOS 15. All Apple Watches from the 2017’s Series 3 or newer can install WatchOS 8. How do I get it? Open the Settings app on an iPhone or iPad then navigate to General &gt; Software Update. Tap install if available to download, verify and then reboot to install. You can also install the update via a Mac or iTunes on a Windows computer. WatchOS 8 req...",
            bodyHtml: "<p>The latest iteration of Amazon’s battery-powered Ring doorbell adds a new feature to capture the early details of events most competitors would miss without needing to be plugged in.</p> <p>The Ring Video Doorbell 4 costs £179 ($199.99/$A329) and can be installed in any home with wifi. It tops Ring’s battery-powered range, which starts at £89.</p> <p>The look and basic function of the Doorbell 4 is very similar to Ring’s <a href=\"https://www.theguardian.com/technology/2018/feb/01/ring-video-doorbell-2-review-deal-with-doorsteppers-from-your-own-sofa\">older models</a>. It has a camera with night vision, motion sensors and a large doorbell button.</p> <p>When someone pushes the button Ring’s signature chime plays and an alert is sent to your phone. You can view a live feed and speak through the doorbell using the app from anywhere with internet. If you don’t answer, the new “quick replies” feature is like an answering machine for your door, recording caller’s messages. And it works as a motion-activated security camera too.</p> <h2><strong>Four seconds of pre-roll</strong></h2>  <figure class=\"element element-image\" data-media-id=\"e399416455b352ed68c1018e92084106ce2cfff0\"> <img src=\"https://media.guim.co.uk/e399416455b352ed68c1018e92084106ce2cfff0/642_627_3952_2371/1000.jpg\" alt=\"Ring Video Doorbell 4 review\" width=\"1000\" height=\"600\" class=\"gu-image\" /> <figcaption> <span class=\"element-image__caption\">A ring of blue LEDs lights up when the doorbell is pressed showing that it is active and something is happening, such as you answering the door through the camera.</span> <span class=\"element-image__credit\">Photograph: Samuel Gibbs/The Guardian</span> </figcaption> </figure>  <p>Most battery-powered doorbells sleep until motion</p> </blockquote>"
            
        )
    )
}
