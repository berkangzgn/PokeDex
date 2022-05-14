//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Berkan Gezgin on 25.04.2022.
//

import SwiftUI
import Firebase

@main
struct PokeDexApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var
        delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: AppDelegate-Firebase Integration
class Appdelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}
