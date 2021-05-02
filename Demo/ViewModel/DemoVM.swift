//
//  LoginVM.swift
//  Masam
//
//  Created by MacBookPro on 29/04/21.
//

import Foundation

class DemoVM: NSObject {
    static let sharedInstance = DemoVM()
    //var notificationListData: [NotificationItem]? = [NotificationItem]()
    var dataSuccess: ((DemoModel) -> Void)?
    var dataFetchFailed: ((String) -> Void)?
    var dataFetchFailed1: (() -> Void)?
    var delegate:DemoveDataDelegate!
//    var demoDataDelegate:DemoDataDelegate!
    // MARK: - Init
    override init() {
        super.init()
    }
    
    func getDataForHome(delgate:DemoveDataDelegate) {
        self.delegate = delgate
        if let dataAvailable = DemoModel.convertData(){
            //self.dataSuccess?(dataAvailable)
            delegate.dataDidLoad(data: dataAvailable)
        }else{
            self.dataFetchFailed?("Unable to get the data.")
        }
    }
}
