//
//  TrainingWidgetExtensionLiveActivity.swift
//  TrainingWidgetExtension
//
//  Created by Matthew Fang on 3/3/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TrainingWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TrainingWidgetExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TrainingWidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TrainingWidgetExtensionAttributes {
    fileprivate static var preview: TrainingWidgetExtensionAttributes {
        TrainingWidgetExtensionAttributes(name: "World")
    }
}

extension TrainingWidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: TrainingWidgetExtensionAttributes.ContentState {
        TrainingWidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TrainingWidgetExtensionAttributes.ContentState {
         TrainingWidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TrainingWidgetExtensionAttributes.preview) {
   TrainingWidgetExtensionLiveActivity()
} contentStates: {
    TrainingWidgetExtensionAttributes.ContentState.smiley
    TrainingWidgetExtensionAttributes.ContentState.starEyes
}
