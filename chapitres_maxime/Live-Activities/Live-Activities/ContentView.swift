//
//  ContentView.swift
//  Live-Activities
//
//  Created by Maxime Britto on 19/09/2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var status:String = ""
    @State var currentInterval: ClosedRange<Date>?
    @State var currentActivity: Activity<LearnTimerAttributes>?
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            Text(status)
            if let activity = currentActivity {
                Button("Terminé l'activité") {
                    Task {
                        await stopActivity(activity)
                    }
                }
            } else {
                Button("Démarrer le minuteur") {
                    startLiveActivity()
                }
            }
        }
        .padding()
        .onOpenURL { url in
            status = url.absoluteString
            if (url.pathComponents.contains("add-time")){
                Task {
                    await addTime()
                }
            } else if (url.pathComponents.contains("stop-timer")) {
                if let activity = currentActivity {
                    Task {
                        await stopActivity(activity)
                    }
                }
            }
        }
    }
    
    func addTime() async {
        guard let currentActivity = currentActivity, let interval = currentInterval else { return }
        let newEndDate = interval.upperBound.addingTimeInterval(15 * 60)
        let newInterval = interval.lowerBound...newEndDate
        
        await currentActivity.update(using: LearnTimerAttributes.LearnTimerStatus(plannedDuration: newInterval))
        currentInterval = newInterval
        status = "15 minutes ajoutées"
    }
    
    func stopActivity(_ activity:Activity<LearnTimerAttributes>) async {
        await activity.end(dismissalPolicy: .immediate)
        currentActivity = nil
        status = "Activité terminée"
    }
    
    func startLiveActivity() {
        let startDate = Date.now;
        guard let endDate = Calendar.current.date(byAdding: .minute, value: 1, to: startDate) else {
            return
        }
        let interval = startDate...endDate
        let attributes = LearnTimerAttributes(courseName: "Les nouveautés de iOS 16")
        let state = LearnTimerAttributes.LearnTimerStatus(plannedDuration: interval)
        
        do {
            currentActivity = try Activity.request(attributes: attributes, contentState: state)
            currentInterval = interval
            status = "Apprentissage débuté"
        } catch (let error) {
            status = "Erreur : \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
