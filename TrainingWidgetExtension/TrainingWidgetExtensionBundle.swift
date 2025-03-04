//
//  TrainingWidgetExtensionBundle.swift
//  TrainingWidgetExtension
//
//  Created by Matthew Fang on 3/3/25.
//

import WidgetKit
import SwiftUI

@main
struct TrainingWidgetExtensionBundle: WidgetBundle {
    var body: some Widget {
        TrainingWidgetExtension()
        TrainingWidgetExtensionControl()
        TrainingWidgetExtensionLiveActivity()
    }
}
