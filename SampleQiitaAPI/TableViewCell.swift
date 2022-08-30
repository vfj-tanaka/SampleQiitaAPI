//
//  TableViewCell.swift
//  SampleQiitaAPI
//
//  Created by mtanaka on 2022/08/30.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func prepareForReuse() {
        
        label.text = nil
        urlLabel.text = nil
    }
    
    func configure(model: QiitaModel) {
        
        label.text = model.title
        urlLabel.text = model.url
    }
}
