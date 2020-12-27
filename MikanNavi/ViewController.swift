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
        
        self.navigationItem.title = "新着みかん"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
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
    
    @IBAction func postOrangeButtonTapped(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "PostOrangeView", bundle: nil)
        let po = sb.instantiateViewController(identifier: "PostOrangeView")
        self.present(po, animated: true, completion: nil)
    }
    
}

