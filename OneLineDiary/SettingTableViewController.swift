//
//  SettingTableViewController.swift
//  OneLineDiary
//
//  Created by 이승현 on 2023/08/01.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        get {
            switch self {
            case .total: return "전체 설정"
            case .personal: return "개인 설정"
            case .others: return "기타"
            }
            
        }
            }
    var subOptions: [String] {
        switch self {
        case . total: return ["공지사항", "실험실", "버전 정보"]
        case . personal: return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case . others: return ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
//    let first = ["공지사항", "실험실", "버전 정보"]
//    let second = ["개인/보안", "알림", "채팅", "멀티프로필"]
//    let third = ["고객센터/도움말"]
//    let list = [
//        ["공지사항", "실험실", "버전 정보"],
//        ["개인/보안", "알림", "채팅", "멀티프로필"],
//        ["고객센터/도움말"]
//    ]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    // 0번에 3개, 1번에 4개 2번에 1개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOptions.count
//        if section == 0 {
//            return list[0].count
//        } else if section == 1 {
//            return list[1].count
//        } else {
//            return list[2].count
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.textColor = .black //list[indexPath.section][indexPath.row]
        
        return cell
    }
}
