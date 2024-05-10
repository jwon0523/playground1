//
//  ContentView.swift
//  PushNotification
//
//  Created by jaewon Lee on 5/11/24.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was so easy!"
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5.0,
            repeats: false)
        
        // calender
//        var dateComponentes = DateComponents()
//        // Execute push notification at 01:57 am everyday
//        dateComponentes.hour = 1
//        dateComponentes.minute = 57
//        dateComponentes.weekday = 7 // Saturday
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentes, repeats: true)
//        
        // location
//        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
//        
//        let region = CLCircularRegion(
//            center: coordinates,
//            radius: 100,
//            identifier: UUID().uuidString
//        )
//        region.notifyOnEntry = true
//        region.notifyOnExit = false
//        let trigger = UNLocationNotificationTrigger(
//            region: region,
//            repeats: true
//        )
        
        // request
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                NotificationManager.instance.requestAuthorization()
            }, label: {
                Text("Request permissions")
            })
            Button(action: {
                NotificationManager.instance.scheduleNotification()
            }, label: {
                Text("Schedule notification")
            })
            Button(action: {
                NotificationManager.instance.cancelNotification()
            }, label: {
                Text("Cancel notification")
            })
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    ContentView()
}
