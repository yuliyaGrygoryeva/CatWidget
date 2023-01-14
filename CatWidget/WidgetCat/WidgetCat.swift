//
//  WidgetCat.swift
//  WidgetCat
//
//  Created by Yuliya  on 1/13/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("cat", store: UserDefaults(suiteName: "group.Yuliya-Grygoryeva.CatWidget"))
    var catData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), cat: Cat(image: "cat1", name: "First cat", realName: "Meow"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let cat = try? JSONDecoder().decode(Cat.self, from: catData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, cat: cat)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let cat = try? JSONDecoder().decode(Cat.self, from: catData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, cat: cat)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let cat: Cat
}

struct WidgetCatEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.cat.image))
    }
}

struct WidgetCat: Widget {
    let kind: String = "WidgetCat"

    var body: some WidgetConfiguration {
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetCatEntryView(entry: entry)
        }
        .configurationDisplayName("My Cat Widget")
        .description("This is an example of cat widget.")
    }
}

struct WidgetCat_Previews: PreviewProvider {
    static var previews: some View {
        WidgetCatEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), cat: Cat(image: "cat1", name: "cat", realName: "meow")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
