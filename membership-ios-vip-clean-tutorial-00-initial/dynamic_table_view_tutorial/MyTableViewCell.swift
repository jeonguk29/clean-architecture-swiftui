//
//  MyTableViewCell.swift
//  dynamic_table_view_tutorial
//
//  Created by Jeff Jeong on 2020/09/02.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var userContentLabel: UILabel!
    
    @IBOutlet var userTitleLabel: UILabel!
    // 쎌이 랜더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
        
    }
    
    func configureCell(post: PostList.FetchPostList.ViewModel.DisplayedPost) {
        self.userTitleLabel.text = post.title
        self.userContentLabel.text = post.content
    }
    
}
