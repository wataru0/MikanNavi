//
//  ModalViewController.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/27.
//

import UIKit
import Nuke

class ModalViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var sendedUrl: String?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.6, green: 0.2, blue: 0.2, alpha: 0.4)
        let url = "http://liquidmetal.ml/" + sendedUrl! 
        guard let iconUrl = URL(string: url) else { return }
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "load"),
            failureImage: UIImage(named: "load"),
            failureImageTransition: .fadeIn(duration: 0.33),
            contentModes: .init(success: .scaleAspectFit, failure: .scaleToFill, placeholder: .scaleToFill))
        Nuke.loadImage(with: iconUrl, options: options, into: imageView)
    }
}
