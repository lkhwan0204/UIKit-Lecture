import UIKit

class LifecycleViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Lifecycle Demo"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다음 화면으로 이동", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupLayout()
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)

        print("viewDidLoad - 첫 번째 화면 로드됨")
    }

    func setupLayout() {
        view.addSubview(label)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            // Label 중앙 정렬
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            // 버튼 화면 하단 고정
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    @objc func goToNextScreen() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
