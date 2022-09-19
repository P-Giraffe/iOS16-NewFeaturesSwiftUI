//
//  Subscription.swift
//  iOS16-NewFeaturesSwiftUI
//
//  Created by Johan Guenaoui on 13/09/2022.
//
import Foundation

struct Subscription : Identifiable {
    let month:Date
    let numberSubscription:Int
    let dailyAverage:Int
    let dailyMin:Int
    let dailyMax:Int
    
    var id:Date { month }
}

extension Date {
    var calendar: Calendar { Calendar.current }
    
    var quarter: Int {
            let month = Double(calendar.component(.month, from: self))
            let numberOfMonths = Double(calendar.monthSymbols.count)
            let numberOfMonthsInQuarter = numberOfMonths / 4
            return Int(ceil(month / numberOfMonthsInQuarter))
    }
    
    var month: Int {
            get {
                return calendar.component(.month, from: self)
            }
            set {
                let allowedRange = calendar.range(of: .month, in: .year, for: self)!
                guard allowedRange.contains(newValue) else { return }

                let currentMonth = calendar.component(.month, from: self)
                let monthsToAdd = newValue - currentMonth
                if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
                    self = date
                }
            }
        }
    
    var isFirstMonthOfQuarter:Bool {
        get {
            switch(self.quarter) {
            case 1: if(self.month==1){return true}else{return false}
            case 2: if(self.month==4){return true}else{return false}
            case 3: if(self.month==7){return true}else{return false}
            case 4: if(self.month==10){return true}else{return false}
            default:return false;
            }
        }
    }
}
