//
//  AppConstants.swift
//  Hosting Tracking
//
//  Created by Murugan on 07/08/20.
//  Copyright © 2020 Murugan. All rights reserved.
//

import UIKit

public typealias GenericClosure<T> = (_ value: T)->()

enum App: String{
    case AppTheme = "#ff2b2b"
    var Color : UIColor {
        return UIColor.init(named: self.rawValue)!
    }
}



enum Storyboards : String {
    case Main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}


struct StoryBoardID {
    static let initialView = "ViewController"
}
