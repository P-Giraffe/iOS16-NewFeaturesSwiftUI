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
            LiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                <#code#>
            } compactLeading: {
                Image("logo")
                    .resizable()
                    .frame(width: 25, height: 25)
            } compactTrailing: {
                Text(timerInterval: context.state.plannedDuration, countsDown: true)
                    .frame(width: 40)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(timerInterval: context.state.plannedDuration, countsDown: true)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }

        }

    }
}

struct LiveActivityView : View {
    let context:ActivityViewContext<LearnTimerAttributes>
    var body: some View {
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
    }
}

