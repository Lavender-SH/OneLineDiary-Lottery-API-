//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 이승현 on 2023/07/31.
//

import UIKit

enum TransitionType {
    case add
    case edit
}

class AddViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var contentTextView: UITextView!
    var type: TransitionType = .add
    var contents: String?
    //placeholder
    let placeholderText = "내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        contentTextView.delegate = self
        contentTextView.text = placeholderText
        contentTextView.textColor = .lightGray
        
        //추가 화면일 때는 빈 텍스트뷰를, 수정 화면 일 떄는 이전 내용을 값 전달해서 텍스트뷰에 보여주기
        
        
        switch type {
        case .add:
            title = "추가 화면"
            let xmark = UIImage(systemName: "xmark")
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(closeButtonClicked))
            navigationItem.leftBarButtonItem?.tintColor = .black
            
        case .edit:
            title = "수정 화면"
            guard let contents else { return }
            contentTextView.text = contents
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count)글자"
    }
    
    //편집이 시작될 떄(커서가 시작될 때)
    //플레이스 홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = nil
            textView.textColor = .black
        }
        
        
    }
    //편집이 끝날 때(커서가 없어지는 순간)
    //사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 설정!
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    
    
    
    
    @objc
    func closeButtonClicked(_ sender: UIBarButtonItem) {
       dismiss(animated: true)
    }
}
