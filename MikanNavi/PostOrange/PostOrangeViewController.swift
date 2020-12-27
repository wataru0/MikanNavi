//
//  PostOrangeViewController.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/26.
//

import UIKit
import Eureka
import ImageRow
import Alamofire

class PostOrangeViewController: FormViewController {
    
    var myTitle: String?
    var postButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // スクリーンの横縦幅
        let screenWidth:CGFloat = self.view.frame.width
        let screenHeight:CGFloat = self.view.frame.height
        
        
        form
            +++ Section("あなたのみかん")
            <<< TextRow { row in
                row.tag = "title"
                row.placeholder = "タイトルを入力してください"
            }.onChange{ row in
                self.myTitle = row.value
            }
            <<< ImageRow() { row in
                row.title = "画像"
                row.tag = "image"
                row.sourceTypes = [.PhotoLibrary,.Camera]
                row.clearAction = .yes(style: UIAlertAction.Style.destructive)
                row.onChange{row in
                    row.reload()//変更がすぐ反映されるようにリロードする
                }
            }
        
        // postボタンの追加
        postButton = UIButton()
        // ボタンを押した時に実行するメソッドを指定
        postButton.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)
        // ラベルを設定する
        postButton.setTitle("投稿", for: UIControl.State.normal)
        postButton.setTitleColor(UIColor.white, for: .normal)
        postButton.backgroundColor = .orange
        postButton.layer.cornerRadius = 10.0
        postButton.frame = CGRect(x:screenWidth/4, y:screenHeight/2,
                                  width:screenWidth/2, height:50)
        
        // サイズを決める(自動調整)
//        postButton.sizeToFit()
        
        // 位置を決める(画面中央)
        postButton.center = self.view.center
        
        // viewに追加する
        self.view.addSubview(postButton)
        
    }
    
    // POSTの処理
    func HttpRequest(name: String, title: String) {
        let url = ""
        let parameters: [String: Any] = [
            "name": name,
            "title": title
        ]
    }
    
    // ボタンが押された時に呼ばれるメソッド
    @objc func buttonEvent(_ sender: UIButton) {
        postButton.backgroundColor = .gray
        self.dismiss(animated: true, completion: nil)
    }
}
