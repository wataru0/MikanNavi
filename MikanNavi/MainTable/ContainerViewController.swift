//
//  ContainerViewController.swift
//  MikanNavi
//
//  Created by 岡本航昇 on 2020/12/27.
//

import UIKit
import Alamofire

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        // 空のセルの線を消す
        tableView.tableFooterView = UIView(frame: .zero)
        
        getArticles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // APIリクエスト
    func getArticles() {
        // Alamofire -> AFになった（新しいバージョン）
        AF.request("https://qiita.com/api/v2/items", method: .get).responseJSON {
            ( response ) in
            let decoder: JSONDecoder = JSONDecoder()
            do {
                // decode関数の引数にはJSONからマッピングさせたいクラスをと実際のデータを指定する
                self.articles = try decoder.decode([Article].self, from: response.data!)
                //print(articles[0].title) // タイトル取得できた
                
            } catch {
                // JSONの形式とクラスのプロパティが異なっている場合には失敗する
                print("failed")
               // print(error.localizedDescription)
            }
        }
        
    }
}
extension ContainerViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    // セル作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.set()
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //
    //        return UITableView.automaticDimension //自動設定
    //    }
    
    
}
extension ContainerViewController: UITableViewDelegate {
}
