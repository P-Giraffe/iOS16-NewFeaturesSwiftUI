//
//  extension_widget.swift
//  extension-widget
//
//  Created by Maxime Britto on 19/09/2022.
//

import WidgetKit
import SwiftUI
import ActivityKit

@main
struct LearnTimerActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for:LearnTimerAttributes.self) { context in
            VStack {
                Text(context.attributes.courseName)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                HStack {
                    Text(context.state.plannedDuration.lowerBound, style: .time)
                    ProgressView(timerInterval: context.state.plannedDuration, countsDown: false)
                    Text(context.state.plannedDuration.upperBound, style: .time)
                }
            }.padding()
        } dynamicIsland: { context in
            <#code#>
        }

    }
}

