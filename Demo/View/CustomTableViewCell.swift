//
//  ListTableViewCell.swift
//  model
//
//  Created by Apple on 22/02/21.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customCollectionView: UICollectionView!
    @IBOutlet weak var baseView: UIView!
    var sectionData:SectionModel!
    var selectedDelegate :SelectionDelegate!
    var sectionIndex:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(data:DemoModel!,sectionIndex:Int,selectedDelegate :SelectionDelegate){
        self.sectionIndex = sectionIndex
        self.sectionData = data.sectionData[sectionIndex]
        self.selectedDelegate = selectedDelegate
        descriptionLabel.text = ""
        if let data = sectionData.isSelected{
            if data == true{
                descriptionLabel.text = sectionData.selectedDiscription
            }
        }
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        self.customCollectionView.registerCellNib(CustomCollectionVewCell.self)
        customCollectionView.reloadData()
    }    
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData.rowData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionVewCell", for: indexPath) as! CustomCollectionVewCell
        let rowItem = sectionData.rowData[indexPath.item]
        cell.titleLabel.text = rowItem.rowName
        cell.contentView.isUserInteractionEnabled = false
        if let data = rowItem.isSelected{
            cell.isSelected = data
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selected = data.sectionData[sectionIndex].rowData[indexPath.item].isSelected{
            if let row = data.sectionData[sectionIndex].rowData.firstIndex(where: {$0.isSelected == true}) {
                var tempData = data.sectionData[sectionIndex].rowData[row]
                tempData.isSelected = false
                data.sectionData[sectionIndex].rowData[row] = tempData
            }
            data.sectionData[sectionIndex].rowData[indexPath.item].setSelected(selected: !selected)
            data.sectionData[sectionIndex].setSelected(selected: !selected)

        }else{
            data.sectionData[sectionIndex].rowData[indexPath.item].setSelected(selected: true)
            data.sectionData[sectionIndex].setSelected(selected: true)

        }
        data.sectionData[sectionIndex].setDiscription(discription: sectionData.rowData[indexPath.item].rowDiscription)
        selectedDelegate.selectedRowItem(updatedModel: data)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        data.sectionData[sectionIndex].rowData[indexPath.item].setSelected(selected: false)
//        data.sectionData[sectionIndex].setSelected(selected: false)
//        data.sectionData[sectionIndex].setDiscription(discription: sectionData.rowData[indexPath.item].rowDiscription)
//        data.sectionData[sectionIndex].setDiscription(discription: "")
//        selectedDelegate.selectedRowItem(updatedModel: data)
//    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 70, height: 70)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 4
        }
    }


