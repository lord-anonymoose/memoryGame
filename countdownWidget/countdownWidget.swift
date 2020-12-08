//
//  countdownWidget.swift
//  countdownWidget
//
//  Created by Philipp on 07.12.2020.
//

import WidgetKit
import SwiftUI
import Intents


struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
}

struct countdownWidgetEntryView : View {
    var entry: Provider.Entry
    let xmasComponents = DateComponents(year: 2020, month: 12, day: 25)
    let xmas = Calendar.current.date(from: DateComponents(year: 2020, month: 12, day: 25))!
    let ny = Calendar.current.date(from: DateComponents(year: 2021, month: 1, day: 1))!
    let currentDate = Date()

    let dateFormatter = DateFormatter()
    var body: some View {
        Color("WidgetBackground")
            .overlay (
            HStack {
                VStack {
                    Text("🎅🏻")
                        .font(.system(size: 40))
                    VStack {
                        Text("X-mas:")
                        Text("\(Calendar.current.dateComponents([.day], from: currentDate, to: xmas).day!)")
                    }
                    .font(.system(size: 16))
                }
                VStack {
                    Text("🎄")
                        .font(.system(size: 40))
                    VStack {
                        Text("New Year:")
                        Text("\(Calendar.current.dateComponents([.day], from: currentDate, to: ny).day!)")
                    }
                    .font(.system(size: 16))
                }
            }
        )
    }
}
@main
struct countdownWidget: Widget {
    let kind: String = "countdownWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            countdownWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct countdownWidget_Previews: PreviewProvider {
    static var previews: some View {
        countdownWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
