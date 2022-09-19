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
            Button("Démarrer le minuteur") {
                startLiveActivity()
            }
        }
        .padding()
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
