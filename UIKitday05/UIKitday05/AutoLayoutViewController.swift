import UIKit

class AutoLayoutViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Auto Layout 연습"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        view.addSubview(titleLabel)
        view.addSubview(redView)
        
        func setupLayout() {
            // 생성한 뷰 화면에 붙인다
            view.addSubview(titleLabel)
            view.addSubview(redView)
            
            // 긴 속성 짧게 ...
            // let titleTop = titleLabel.topAnchor
            // let safeTop = view.safeAreaLayoutGuide.topAnchor
            
            // 긴 속성 짧게 해주는 사용자 정의 클래스
            let title = MyConstraints(titleLabel)
            let redBox = MyConstraints(redView)
            
            // 오토레이아웃 설정
            NSLayoutConstraint.activate([
                title.top.constraint(equalTo: title.safeTop, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                redBox.top.constraint(equalTo: title.bottom, constant: 20), // titleLabel 아래 20만큼 띄움
                redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // 좌측 여백 20
                redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 우측 여백 20
                redView.heightAnchor.constraint(equalToConstant: 200) // 높이 200 고정
            ])
        }
    }
}
