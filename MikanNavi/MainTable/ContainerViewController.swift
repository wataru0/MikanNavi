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
    public var articles: [Article] = []
    public var mikans: [Mikan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        // 空のセルの線を消す
        tableView.tableFooterView = UIView(frame: .zero)
        
        getArticles()
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // APIリクエスト
    // GETの処理
    func getArticles() {
//        let url = "https://qiita.com/api/v2/items"
        let url = "http://liquidmetal.ml/display"
        // Alamofire -> AFになった（新しいバージョン）
        AF.request(url, method: .get).responseJSON {
            ( response ) in
            let decoder: JSONDecoder = JSONDecoder()
            do {
                // decode関数の引数にはJSONからマッピングさせたいクラスをと実際のデータを指定する
//                self.articles = try decoder.decode([Article].self, from: response.data!)
//                // タイトル取得できた
//                print(self.articles[0].title, self.articles.count)
                
                self.mikans = try decoder.decode([Mikan].self, from: response.data!)
                print(self.mikans, self.mikans.count)
                self.tableView.reloadData()
            } catch {
                // JSONの形式とクラスのプロパティが異なっている場合には失敗する
                print("failed")
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}
extension ContainerViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(articles.count)
        //return articles.count
        return mikans.count
    }
    
    // セル作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        //let article = articles[indexPath.row]
        let mikan = mikans[indexPath.row]
        
        cell.set(mikan)
        return cell
    }
        
}
extension ContainerViewController: UITableViewDelegate {
}
