//
//  NewsAppWidget.swift
//  NewsAppWidget
//
//  Created by Matthew Folbigg on 01/10/2021.
//

import WidgetKit
import SwiftUI
import Intents
//import NewsApp

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), article: GuardianArticle.testData)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, article: GuardianArticle.testData)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, article: GuardianArticle.testData)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let article: GuardianArticle
}

struct NewsAppWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.article.title)
            Spacer()
            Text(entry.date, style: .time)
                .font(Font.system(.caption, design: .monospaced))
        }
        .padding()
    }
}

@main
struct NewsAppWidget: Widget {
    let kind: String = "NewsAppWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            NewsAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Latest Tech News")
        .description("My First Widget! Displays the lastest tech news.")
    }
}

struct NewsAppWidget_Previews: PreviewProvider {
    static var previews: some View {
        NewsAppWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), article: GuardianArticle.testData))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
