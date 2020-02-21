//
//  ViewController.swift
//  sandbox
//
//  Created by 吉田　裕澄 on 2019/08/25.
//  Copyright © 2019 吉田　裕澄. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let TODO = ["電源入れる。", "ログインする。", "xCode起動する。"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = TODO[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    

}

