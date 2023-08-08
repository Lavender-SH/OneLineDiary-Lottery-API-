//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1", "테스트2테스트2테스트2테스트2", "테스트3테스트3테스트3테스트3"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        let nib = UINib(nibName:"DiaryTableViewCell", bundle: nil)
        //XIB로 테이블뷰셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요!
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
        
       // tableView.backgroundColor = .clear
        
        //Dynamic Height: 1. automaticDimension, 2. label numberOfLines 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func searchBarButtonItemClicked(_ sender: UIBarButtonItem) {
        
        
        //Search 아이콘 클릭 시 SearchCollectionViewController Push!
    }
    

    
    
    
    @IBAction func addBarButtonItemClicked(_ sender: UIBarButtonItem) {
        
        //1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        vc.type = .add
        
        //2-1(옵션). 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        let nav = UINavigationController(rootViewController: vc)
        //3. 화면 전환 방식 설정
//        v                                                                                                                                                                          c.modalTransitionStyle.crossDissolve //모달 애니메이션
//        vc.modalPresentationStyle = .fullScreen //모달 방식
        //4. 화면 띄우기
        
        
        present(nav, animated: true)
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryTableViewCell") as? DiaryTableViewCell else { return UITableViewCell()
    }
    
    cell.contentLabel.numberOfLines = 0
    cell.contentLabel.text = list[indexPath.row]
    cell.backgroundColor = .clear
    return cell
    }
    
    //1. System Delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true }
    
    //2. System Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
//        if indexPath.row == 0 {
//            list.remove(at: 0)
//        } else if indexPath.row == 1 {
//            list.remove(at: 1)
//        } else if indexPath.row == 2 {
//            list.remove(at: 2)
//        }
        
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //DetailViewController(UIViewController) 생성해서 present 해보기!
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
       // vc.contents = "Diary 뷰컨트롤러에서 데이터 전달하면서 화면 전환 하기!!"
        vc.type = .edit
     //   vc.contentsTextView.text = list[indexPath.row]
        //값 전달 시 아웃렛을 활용할 수는 없음
//        vc.contentsLabel.text = list[indexPath.row]
        
        //인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push가 동작합니다!
        navigationController?.pushViewController(vc, animated: true)
        //UISwipeActiionsConfiguration(actions: [UIContextualAction]
    }
    
//    //Custom Swipe
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }
//
//
//    //Custom Swipe
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    
}
