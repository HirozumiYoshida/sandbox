//
//  LBPC100ViewController.swift
//  sandbox
//
//  Created by 吉田　裕澄 on 2020/02/14.
//  Copyright © 2020 吉田　裕澄. All rights reserved.
//

import UIKit
import SideMenu
class LBPC100ViewController: UIViewController {

    var window: UIWindow?
    var lblHsyType = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        // Do any additional setup after loading the view.
        

        let scrollView = UIScrollView()
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:1000)
//        scrollView.backgroundColor = .orange
        self.view.addSubview(scrollView)

        let viewController = self
        let navigationController = UINavigationController(rootViewController: viewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        self.navigationItem.title = "結果報告(修理)"
        
        let menuViewController = MenuViewController()
        let menuNavigationController = SideMenuNavigationController(rootViewController: menuViewController)
        SideMenuManager.default.leftMenuNavigationController = menuNavigationController
        SideMenuManager.default.addPanGestureToPresent(toView: navigationController.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: navigationController.view, forMenu: .left)

        setContents(scrollView: scrollView)

        //サイドメニュー呼び出し
/*
        let menu = SideMenuManager.defaultManager.leftMenuNavigationController!
          present(menu, animated: true, completion: nil)

          NotificationCenter.default.addObserver(
              self,
              selector: #selector(catchSelectMenuNitification(notification:)),
              name: Notification.Name("SelectMenuNotification"),
              object: nil)
*/
    }
    
    func setContents(scrollView: UIScrollView) -> Void {
        let BTN_COLOR :UIColor = UIColor(displayP3Red: 0.035, green: 0.472, blue: 0.808, alpha: 1)
        //作業者
        let btnSgysha = UIButton()
        btnSgysha.setTitle("作業者", for: .normal)
        btnSgysha.frame = CGRect(x:10,y:20,width:100,height:30)
        btnSgysha.backgroundColor = BTN_COLOR
        btnSgysha.layer.cornerRadius = 10.0
        scrollView.addSubview(btnSgysha)
        
        let lblSgysha = UILabel()
        lblSgysha.frame = CGRect(x:150,y:20,width:160,height:30)
        lblSgysha.text = "2039982 上村　大輔"
        scrollView.addSubview(lblSgysha)
        
        //エラーコード
        let lblErrCd = UILabel()
        lblErrCd.frame = CGRect(x:10,y:70,width:100,height: 30)
        lblErrCd.text = "エラーコード"
        scrollView.addSubview(lblErrCd)
        
        let txtErrCd = UITextField()
        txtErrCd.frame = CGRect(x:150,y:70,width:80,height:30)
        txtErrCd.text = "04F0"
        scrollView.addSubview(txtErrCd)
        
        //休日夜間
        let lblHoliday = UILabel()
        lblHoliday.frame = CGRect(x:150,y:120,width:40,height:30)
        lblHoliday.text = "休日"
        scrollView.addSubview(lblHoliday)
        let swHoliday = UISwitch()
        swHoliday.frame = CGRect(x:190,y:120,width:10,height:30)
        scrollView.addSubview(swHoliday)
        
        let lblNight = UILabel()
        lblNight.frame = CGRect(x:250,y:120,width:40,height:30)
        lblNight.text = "夜間"
        scrollView.addSubview(lblNight)
        let swNight = UISwitch()
        swNight.frame = CGRect(x:290,y:120,width:10,height:30)
        scrollView.addSubview(swNight)
        
        //特別取扱
        let btnTkbtSj = UIButton()
        btnTkbtSj.setTitle("特別取扱", for: .normal)
        btnTkbtSj.frame = CGRect(x:10,y:170,width:100,height:30)
        btnTkbtSj.backgroundColor = BTN_COLOR
        btnTkbtSj.layer.cornerRadius = 10.0
        scrollView.addSubview(btnTkbtSj)

        let txtTkbtSj = UITextField()
        txtTkbtSj.frame = CGRect(x:150,y:170,width:100,height:30)
        txtTkbtSj.text = "99999-99"
        scrollView.addSubview(txtTkbtSj)
        
        //保証タイプ
        let lblHsyTypeTitle = UILabel()
        lblHsyTypeTitle.text = "保証タイプ"
        lblHsyTypeTitle.frame = CGRect(x:10,y:220,width:100,height:30)
        scrollView.addSubview(lblHsyTypeTitle)

        //let lblHsyType = UILabel()
        lblHsyType.frame = CGRect(x:150,y:220,width:40,height:30)
        lblHsyType.text = "PB品"
        scrollView.addSubview(lblHsyType)
        let swHsyType = UISwitch()
        swHsyType.frame = CGRect(x:190,y:220,width:10,height:30)
        swHsyType.addTarget(self, action: #selector(self.onClickSwHsyType(sender:)), for: UIControl.Event.valueChanged)
        swHsyType.isOn = true
        scrollView.addSubview(swHsyType)

        //故障現象
        let btnKshGnsh = UIButton()
        btnKshGnsh.setTitle("故障現象", for: .normal)
        btnKshGnsh.frame = CGRect(x:10,y:270,width:100,height:30)
        btnKshGnsh.backgroundColor = BTN_COLOR
        btnKshGnsh.layer.cornerRadius = 10.0
        scrollView.addSubview(btnKshGnsh)

        let lblKshGnsh = UILabel()
        lblKshGnsh.text = "01：点火不良(スパークしない)"
        lblKshGnsh.frame = CGRect(x:150,y:270,width:100,height:30)
        lblKshGnsh.sizeToFit()
        scrollView.addSubview(lblKshGnsh)
        
        //修理箇所
        let btnShrKsh = UIButton()
        btnShrKsh.setTitle("修理箇所", for: .normal)
        btnShrKsh.frame = CGRect(x:10,y:320,width:100,height:30)
        btnShrKsh.backgroundColor = BTN_COLOR
        btnShrKsh.layer.cornerRadius = 10.0
        scrollView.addSubview(btnShrKsh)

        let lblShrKsh = UILabel()
        lblShrKsh.text = "001：圧電機構一式"
        lblShrKsh.frame = CGRect(x:150,y:320,width:100,height:30)
        lblShrKsh.sizeToFit()
        scrollView.addSubview(lblShrKsh)

        //故障原因
        let btnKsyGnin = UIButton()
        btnKsyGnin.setTitle("故障原因", for: .normal)
        btnKsyGnin.frame = CGRect(x:10,y:370,width:100,height:30)
        btnKsyGnin.backgroundColor = BTN_COLOR
        btnKsyGnin.layer.cornerRadius = 10.0
        scrollView.addSubview(btnKsyGnin)

        let lblKsyGnin = UILabel()
        lblKsyGnin.text = "01：折損・変形"
        lblKsyGnin.frame = CGRect(x:150,y:370,width:100,height:30)
        lblKsyGnin.sizeToFit()
        scrollView.addSubview(lblKsyGnin)

        //修理方法
        let btnShrHuhu = UIButton()
        btnShrHuhu.setTitle("修理方法", for: .normal)
        btnShrHuhu.frame = CGRect(x:10,y:420,width:100,height:30)
        btnShrHuhu.backgroundColor = BTN_COLOR
        btnShrHuhu.layer.cornerRadius = 10.0
        scrollView.addSubview(btnShrHuhu)

        let lblShrHuhu = UILabel()
        lblShrHuhu.text = "01：部品交換"
        lblShrHuhu.frame = CGRect(x:150,y:420,width:100,height:30)
        lblShrHuhu.sizeToFit()
        scrollView.addSubview(lblShrHuhu)

        //保証-保証判定
        let btnHsySelect = UIButton()
        btnHsySelect.setTitle("保証", for: .normal)
        btnHsySelect.frame = CGRect(x:10,y:470,width:100,height:30)
        btnHsySelect.backgroundColor = BTN_COLOR
        btnHsySelect.layer.cornerRadius = 10.0
        scrollView.addSubview(btnHsySelect)

        let lblHsyCd = UILabel()
        lblHsyCd.text = "0227"
        lblHsyCd.frame = CGRect(x:150,y:470,width:100,height:30)
        lblHsyCd.sizeToFit()
        scrollView.addSubview(lblHsyCd)
        
        let lblHsyName = UILabel()
        lblHsyName.text = "TG/エネファームパートメンテ保証"
        lblHsyName.frame = CGRect(x:150,y:500,width:100,height:30)
        lblHsyName.sizeToFit()
        scrollView.addSubview(lblHsyName)

        let btnHsyJudge = UIButton()
        btnHsyJudge.setTitle("保証判定", for: .normal)
        btnHsyJudge.frame = CGRect(x:200,y:470,width:100,height:25)
        btnHsyJudge.backgroundColor = BTN_COLOR
        btnHsyJudge.layer.cornerRadius = 10.0
        scrollView.addSubview(btnHsyJudge)
        
        //ランク
        let btnRnkSet = UIButton()
        btnRnkSet.setTitle("ランク設定", for: .normal)
        btnRnkSet.frame = CGRect(x:10,y:540,width:100,height:30)
        btnRnkSet.backgroundColor = BTN_COLOR
        btnRnkSet.layer.cornerRadius = 10.0
        scrollView.addSubview(btnRnkSet)

        let lblRnk = UILabel()
        lblRnk.text = "4"
        lblRnk.frame = CGRect(x:150,y:540,width:100,height:30)
        lblRnk.sizeToFit()
        scrollView.addSubview(lblRnk)
        
        let lblRnkAuto = UILabel()
        lblRnkAuto.text = "自動設定　4"
        lblRnkAuto.frame = CGRect(x:150,y:570,width:100,height:30)
        lblRnkAuto.sizeToFit()
        scrollView.addSubview(lblRnkAuto)
        
        //請求先
        let lblSkyInfoTitle = UILabel()
        lblSkyInfoTitle.text = "請求先"
        lblSkyInfoTitle.frame = CGRect(x:10,y:620,width:100,height:30)
        lblSkyInfoTitle.sizeToFit()
        scrollView.addSubview(lblSkyInfoTitle)

        let lblSkySkCd = UILabel()
        lblSkySkCd.text = "000001:TG"
        lblSkySkCd.frame = CGRect(x:150,y:620,width:100,height:30)
        lblSkySkCd.sizeToFit()
        scrollView.addSubview(lblSkySkCd)

        //memo
        let lblMemoTitle = UILabel()
        lblMemoTitle.text = "メモ"
        lblMemoTitle.frame = CGRect(x:10,y:670,width:100,height:30)
        lblMemoTitle.sizeToFit()
        scrollView.addSubview(lblMemoTitle)
        
        let txtMemo = UITextView()
        txtMemo.text = "【PB品】"
        txtMemo.frame = CGRect(x:150,y:670,width:250,height:60)
        txtMemo.font = UIFont.boldSystemFont(ofSize: 16)
        txtMemo.textContainerInset = UIEdgeInsets.zero
        txtMemo.textContainer.lineFragmentPadding = 0
        scrollView.addSubview(txtMemo)
        
        //部品報告
        let btnBhnReport = UIButton()
        btnBhnReport.setTitle("部品報告", for: .normal)
        btnBhnReport.frame = CGRect(x:10,y:720,width:100,height:30)
        btnBhnReport.backgroundColor = BTN_COLOR
        btnBhnReport.layer.cornerRadius = 10.0
        scrollView.addSubview(btnBhnReport)

        //保存
        let btnSave = UIButton()
        btnSave.setTitle("保　存", for: .normal)
        btnSave.frame = CGRect(x:300,y:770,width:100,height:30)
        btnSave.backgroundColor = BTN_COLOR
        btnSave.layer.cornerRadius = 10.0
        scrollView.addSubview(btnSave)
    }
    
    @objc func catchSelectMenuNitification(notification: Notification) -> Void {
        let item = notification.userInfo
        print(item)
    }

    @objc func onClickSwHsyType(sender: UISwitch) {
        if sender.isOn {
            lblHsyType.text = "PB品"
        } else {
            lblHsyType.text = "NB品"
        }
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
