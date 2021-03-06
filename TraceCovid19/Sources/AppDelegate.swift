//
//  AppDelegate.swift
//  TraceCovid19
//
//  Created by yosawa on 2020/04/01.
//

import UIKit
import Firebase
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PrintUtility.shared.isHidden = true

        log("launchOptions=\(String(describing: launchOptions))")

        // If we're launched in background because of a Bluetooth event, we were in turnOn state before entering background
        if launchOptions?[.bluetoothCentrals] != nil || launchOptions?[.bluetoothPeripherals] != nil {
            log("BLE state restoration launch")
            let queue = SwinjectStoryboard.defaultContainer.resolve(DispatchQueue.self, name: "BluetoothQueue")!
            let service = SwinjectStoryboard.defaultContainer.resolve(BLEService.self, argument: queue)
            service?.turnOn()
        }

        FirebaseApp.configure()

        // NavigatinBarの色変更
        UINavigationBar.appearance().tintColor = .primary1
        UINavigationBar.appearance().barTintColor = .systemWhite

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
