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
        }
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
