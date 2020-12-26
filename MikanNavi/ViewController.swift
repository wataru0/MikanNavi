//
//  ViewController.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/26.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    @IBOutlet weak var orangeButton: MDCFloatingButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        orangeButton.setBackgroundColor(.orange, for: .normal)
        orangeButton.setImageTintColor(.white, for: .normal)
        orangeButton.imageView?.contentMode = .scaleAspectFit
        
        self.navigationController?.title = "新着みかん"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if (!isUserLoggedIn) {
            let sb: UIStoryboard = UIStoryboard(name: "LoginView", bundle: nil)
            let loginViewController = sb.instantiateViewController(identifier: "LoginView")
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
    @IBAction func debugButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
    }
    
}

