//
//  VideoCell.swift
//  ShareDemo
//
//  Created by 秦传龙 on 2018/11/26.
//  Copyright © 2018年 qclong. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var videoImage: UIImageView!
    
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var laiyuanLabel: UILabel!
    
    @IBOutlet weak var spaceWidth: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commonLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var aNews = NewsModel() {
        didSet {
            
            titleLabel.text = aNews.title;
            
            if aNews.label.count != 0 {
                markLabel.text = aNews.hot ? "热" : aNews.label;
                markLabel.textColor = UIColor.globalRedColor()
                markLabel.layer.borderColor = UIColor.globalRedColor().cgColor;
                markLabel.layer.borderWidth = 1;
            } else {
                markLabel.text = "";
                spaceWidth.constant = 0;
            }
            
            laiyuanLabel.text = "";
            commonLabel.text = aNews.comment_count + "评论";
            timeLabel.text = aNews.publish_time.convertString();
            
            if aNews.media_name != "" {
                laiyuanLabel.text = aNews.media_name
                
            } else if aNews.media_info.media_id != 0 {
                laiyuanLabel.text = aNews.media_info.name
                
            } else if aNews.user_info.user_id != 0 {
                laiyuanLabel.text = aNews.user_info.name
            }
            
            videoImage.sd_setImage(with: URL.init(string: (aNews.large_image_list.first?.url.suffixWebpToPng())!)!, completed: nil);
            
        }
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
