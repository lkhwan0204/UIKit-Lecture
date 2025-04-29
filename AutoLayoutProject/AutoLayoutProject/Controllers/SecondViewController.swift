import UIKit

class SecondViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "두 번째 화면"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("세 번째 화면으로 이동", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        setupLayout()

        nextButton.addTarget(self, action: #selector(goToThirdScreen), for: .touchUpInside)
        print("viewDidLoad - 두 번째 화면 로드됨")
    }

    func setupLayout() {
        view.addSubview(label)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }

    @objc func goToThirdScreen() {
        let thirdVC = ThirdViewController()
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}
