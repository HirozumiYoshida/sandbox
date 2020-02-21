//
//  MenuViewController.swift
//  sandbox
//
//  Created by 吉田　裕澄 on 2020/02/14.
//  Copyright © 2020 吉田　裕澄. All rights reserved.
//

import UIKit
import SideMenu
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var tableView = UITableView();
    var items:[String] = ["件名基本", "状況機器", "作業１", "請求情報", "サイン"]
    
    //テーブルビューの行数を取得する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //リストをテーブルビューに設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    //テーブルビューの行選択時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //選択していたセルの解除
        tableView.deselectRow(at: indexPath, animated: true)
        //サイドバー閉じる
        dismiss(animated: true, completion: nil)
        
        //サイドメニューの呼び出し元に選択した内容を返却
        NotificationCenter.default.post(
            name: Notification.Name("SelectMenuNotification"),
            object:nil,
            userInfo: ["itemNo": indexPath.row]
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .blue
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
