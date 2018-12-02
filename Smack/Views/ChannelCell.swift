//
//  ChannelCell.swift
//  Smack
//
//  Created by Ahmed Mohamed El-Desouky on 11/21/18.
//  Copyright © 2018 Ahmed Mohamed El-Desouky. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var ChannelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.3).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        ChannelName.text = "#\(title)"
        ChannelName.font = UIFont(name: "Avenir-Medium", size: 16)
        
        for id in MessageService.instance.unreadChannels {
            if id == channel.id {
                ChannelName.font = UIFont(name: "Avenir-Heavy", size: 20)
            }
        }
    }
    
}
