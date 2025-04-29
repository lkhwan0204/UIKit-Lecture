//
//  ModalViewController.swift
//  UMC-ios_workbook
//
//  Created by kyuhyeon Lee on 3/11/25.
//

import UIKit

import SnapKit

class ModalViewController: UIViewController {   //uiviewcontroller를 상속받은 새로운 화면 만듬
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {  //UIViewController의 viewDidLoad()를 재정의, 재정의는 우리가 원하는 동작 추가(뷰 컨트롤러 생명주기 관리, 스토리보드에서 연결된 ui 요소들 불러오는 작업...)
        super.viewDidLoad()     //부모의 기본동작을 실행한 후 추가 작업 실행
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemIndigo
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)    //이거 추가한 이유: 버튼 누르면 어떠한 행동을 할지 안정해줬음
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .brown
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true) //뒤로가기 버튼 없이 독립적인 화면을 띄울 때 present를 사용함. 그리고 viewcontroller를 애니메이션 효과가 나오게 화면을 띄움.
    }
}

#Preview {      //ㅁㅊㅁㅊㅁㅊ uikit에서 swiftui처럼 바로 화면 나오게 할 수 있음
    ModalViewController()
}
