//
//  LearnTimerAttributes.swift
//  Live-Activities
//
//  Created by Maxime Britto on 19/09/2022.
//

import Foundation
import ActivityKit

struct LearnTimerAttributes : ActivityAttributes {
    typealias ContentState = LearnTimerStatus
    let courseName:String
    public struct LearnTimerStatus: Codable, Hashable {
        let plannedDuration:ClosedRange<Date>
    }
}
