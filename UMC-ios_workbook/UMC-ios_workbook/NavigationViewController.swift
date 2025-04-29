//
//  ModalViewController.swift
//  UMC-ios_workbook
//
//  Created by kyuhyeon Lee on 3/11/25.
//

import UIKit

import SnapKit      //snpakit은 autolayout에서 더 쉽게 작성할 수 있게 도와주는 라이브러리

class NavigationViewController: UIViewController {  //uiviewcontroller를 상속받은 새로운 화면 만듬 만듬
    private let label = UILabel()       //어제 했던대로 uilabel 객체 선언
    private let button = UIButton()     //button 객체 선언

    override func viewDidLoad() {       //UIViewController의 viewDidLoad()를 재정의, 재정의는 우리가 원하는 동작 추가(뷰 컨트롤러 생명주기 관리, 스토리보드에서 연결된 ui 요소들 불러오는 작업...)
        super.viewDidLoad()     //부모의 기본동작을 실행한 후 추가 작업 실행
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .yellow
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemCyan
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{      //snapkit을 사용해서 auto layout 설정
            $0.top.equalToSuperview().offset(200)   // $0은 label이라 생각하면 됌, label을 화면 맨 위에서 200포인트 아래에 배치
            $0.centerX.equalToSuperview()       //부모뷰의 가로 중앙에 위치하도록 설정
        }
        
        button.snp.makeConstraints{
            $0.top.equalTo(label.snp.bottom).offset(40) //이 뷰를 위쪽에 두고, 라벨 아래쪽을 기준으로 배치하고 40초인트 밑
            $0.centerX.equalToSuperview()   //부모뷰의 가로 중앙과 맞춰라
            $0.height.equalTo(55)   //높이55
            $0.width.equalTo(255)       //가로255
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)    //버튼누르면 buttondidtab이 작동, touchupinside는 버튼을 눌렀다 뗄 때 실행
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .lightGray
        
        navigationController?.pushViewController(viewController, animated: true)    //새로운 화면 전환 하는데 animated를 true로 하면 부드럽게, false로 하면 즉시 전환.
    }
}
#Preview {      //ㅁㅊㅁㅊㅁㅊ uikit에서 swiftui처럼 바로 화면 나오게 할 수 있음
    NavigationViewController()
}
