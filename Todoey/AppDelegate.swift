//
//  AppDelegate.swift
//  Todoey
//
//  Created by Nivan Gujral on 9/4/18.
//  Copyright © 2018 Nivan Gujral. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions")
        
        do {
            let realm = try Realm()
        }catch{
            print("Error instalising new realm, \(error)")
        }
        
        return true
        
    } 
}

