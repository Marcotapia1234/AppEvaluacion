//
//  AppEvaluacionApp.swift
//  AppEvaluacion
//
//  Created by Marco on 7/5/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    //FirebaseApp.configure()


    return true
  }
}
   
@main
struct AppEvaluacionApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var db:Void = FirebaseApp.configure()
    
    var body: some Scene {
         WindowGroup {
             HolderView().environmentObject(AuthViewModel())
         }
    }
}
          
    
    //var almacenInicial = SettingStore()
    
    // Crear una instancia de RestaurantViewModel y pasarle el almacen
   // let viewModel = RestaurantViewModel(almacen: SettingStore())
    
    // register app delegate for Firebase setup
    
    
   var body: some Scene {
        WindowGroup {
            HolderView().environmentObject(AuthViewModel())
            //ContentView(viewModel: viewModel).environmentObject(almacenInicial)
        }
   }
