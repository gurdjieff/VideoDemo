//
//  CollectionViewCell.swift

//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var preImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(_ model:VideoModel) {
        titleLabel.text = model.title;
        durationLabel.text = "duration:" + model.duration.stringValue
        preImageView.sd_setImage(with: URL(string: model.preImageUrl), placeholderImage: nil)
    }
}
