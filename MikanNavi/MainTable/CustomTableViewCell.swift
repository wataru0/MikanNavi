//
//  CustomTableViewCell.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/27.
//

import UIKit
import Nuke

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var mikanImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    
    // buttonの状態，true:押されている
    var gFlag: Bool = false
    var bFlag: Bool = false
    
    func set(_ mikan: Mikan) {
        
        goodButton.tintColor = .gray
        badButton.tintColor = .gray
        
        userNameLabel.text = mikan.name
        titleLabel.text = mikan.title
        
        // debug用
        //let url = "https://stat.ameba.jp/user_images/20090522/23/artes/d0/7d/j/t02200165_0480036010184928609.jpg"
        let url = "http://liquidmetal.ml/"  + mikan.image_path
        guard let iconUrl = URL(string: url) else { return }
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "load"),
            failureImage: UIImage(named: "load"),
            failureImageTransition: .fadeIn(duration: 0.33),
            contentModes: .init(success: .scaleAspectFill, failure: .scaleToFill, placeholder: .scaleToFill))
        Nuke.loadImage(with: iconUrl, options: options, into: mikanImageView)
        
    }
    @IBAction func goodButtonTapped(_ sender: Any) {
        gFlag = !gFlag
        
        if gFlag {
            goodButton.tintColor = .orange
        } else {
            goodButton.tintColor = .gray
        }
    }
    @IBAction func badButtonTapped(_ sender: Any) {
        bFlag = !bFlag
        
        if bFlag {
            badButton.tintColor = .orange
        } else {
            badButton.tintColor = .gray
        }
    }
    @IBAction func imageViewTapped(_ sender: Any) {
    }
    
    override func prepareForReuse() {
        mikanImageView.image = nil
        userNameLabel.text = "user"
        titleLabel.text = "title"
    }
}
