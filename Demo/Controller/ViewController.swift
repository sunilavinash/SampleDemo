//
//  ViewController.swift
//  Demo
//
//  Created by MacBookPro on 29/04/21.
//

import UIKit

var data:DemoModel!
class ViewController: UIViewController {
    @IBOutlet var customTableView: UITableView!
    var data:DemoModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viesSetup()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        if self.isViewLoaded && (self.view.window != nil) {
            self.initializeViewModel()
        }
    }
    
    @objc func initializeViewModel(){
        DemoVM.sharedInstance.getDataForHome()
        DemoVM.sharedInstance.dataSuccess = {(dataAvailable) in
            self.data = dataAvailable
            self.customTableView.reloadData()
        }
    }
    func viesSetup(){
        customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if let datItem = data{
            return datItem.sectionData.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.setupUI(data: data,sectionIndex: indexPath.section, selectedDelegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let view = UIView()
        view.backgroundColor = .clear
        let titleLabel = UILabel.init(frame: CGRect.init(x: 8.0, y: 0, width: 200, height: 30))
        let sectionItem = data.sectionData[section]
        titleLabel.text = sectionItem.sectionName
        view.addSubview(titleLabel)
        return view
    }
}

extension ViewController:SelectionDelegate{
    func selectedRowItem(updatedModel:DemoModel) {
        data = updatedModel
        customTableView.reloadData()
    }
}
