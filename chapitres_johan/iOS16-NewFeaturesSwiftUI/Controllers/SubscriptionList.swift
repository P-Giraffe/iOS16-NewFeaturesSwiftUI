//
//  SubscriptionList.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 13/09/2022.
//

import Foundation

struct SubscriptionSeries:Identifiable {
    let year:String
    let subscriptions:[Subscription]
    
    var id:String {year}
}

struct SubscriptionList {
    var _subscriptions:[Subscription] = []
    var _previousSubscriptions:[Subscription] = []
    var _allSubscriptions:[SubscriptionSeries] = []
    var dateComponent = DateComponents()
    
    init() {
        for i in 1...12 {
            dateComponent.calendar = Calendar.current
            dateComponent.month    = i
            self._subscriptions.append(
                Subscription(
                    month: dateComponent.date!,
                    numberSubscription: Int.random(in: 1..<100),
                    dailyAverage: Int.random(in: 1..<100),
                    dailyMin: Int.random(in: 1..<50),
                    dailyMax: Int.random(in: 50..<100)
                )
            )
        }
        _allSubscriptions.append(SubscriptionSeries(year: "2022", subscriptions: _subscriptions))
        
        for i in 1...12 {
            dateComponent.calendar = Calendar.current
            dateComponent.month    = i
            self._previousSubscriptions.append(
                Subscription(
                    month: dateComponent.date!,
                    numberSubscription: Int.random(in: 1..<100),
                    dailyAverage: Int.random(in: 1..<100),
                    dailyMin: Int.random(in: 1..<50),
                    dailyMax: Int.random(in: 50..<100)
                )
            )
        }
        
        _allSubscriptions.append(SubscriptionSeries(year: "2021", subscriptions: _previousSubscriptions))
    }
}
