//
//  LoginVM.swift
//  Masam
//
//  Created by MacBookPro on 29/04/21.
//

import Foundation
import UIKit

class DemoVM: NSObject {
    
    static let sharedInstance = DemoVM()
    
    //var notificationListData: [NotificationItem]? = [NotificationItem]()
    var dataSuccess: ((DemoModel) -> Void)?
    var dataFetchFailed: ((String) -> Void)?
    
    var loadCheckoutData: ((String) -> Void)?

//    // MARK: - Init
    override init() {
        super.init()
    }
    
    func getDataForHome() {
        if let dataAvailable = DemoModel.convertData(){
            self.dataSuccess?((dataAvailable))
        }else{
            self.dataFetchFailed?("Unable to get the data.")
        }
    }
}
