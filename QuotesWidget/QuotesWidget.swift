//
//  QuotesWidget.swift
//  QuotesWidget
//
//  Created by Khawlah Khalid on 30/11/2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> QuoteEntry {
        QuoteEntry(date: Date(), quote: "No quote at the moment")
    }

    func getSnapshot(in context: Context, completion: @escaping (QuoteEntry) -> ()) {
        let entry = QuoteEntry(date: Date(), quote: MyQuotes.quotes.first ?? "Be the change that you wish to see in the world")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [QuoteEntry] = []

        //Update daily
                let currentDate = Date()
                for dayOffset in 0 ..< 7 {
                    let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
                    let startOfDate = Calendar.current.startOfDay(for: entryDate)//extra step
                    let entry = Entry(date: startOfDate, quote: MyQuotes.quotes.randomElement() ?? "Be the change that you wish to see in the world")
                    entries.append(entry)
                }
                
                let timeline = Timeline(entries: entries, policy: .atEnd)
                completion(timeline)
    }
}

struct QuoteEntry: TimelineEntry {
    let date: Date
    let quote: String
}

struct QuotesWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Image(.background1)
                .resizable()
                .scaledToFill()
            
            VStack{
                Text(entry.quote)
                    .foregroundStyle(Color.white)
                    .padding()
                    .font(.system(size: 20, weight: .semibold))
                    .italic()
                    .lineLimit(3)
                
            }
            
         }
    }
}

struct QuotesWidget: Widget {
    let kind: String = "QuotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                QuotesWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                QuotesWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Quote Widget")
        .description("Have a nice quote every day!")
        
        .contentMarginsDisabled()
    }
}

#Preview(as: .systemSmall) {
    QuotesWidget()
} timeline: {
    QuoteEntry(date: .now, quote: "")
    QuoteEntry(date: .now, quote: "")
}
