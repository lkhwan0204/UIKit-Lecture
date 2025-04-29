import UIKit

class ThirdViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "세 번째 화면"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("첫 번째 화면으로 돌아가기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupLayout()

        backButton.addTarget(self, action: #selector(backToFirstScreen), for: .touchUpInside)
        print("viewDidLoad - 세 번째 화면 로드됨")
    }

    func setupLayout() {
        view.addSubview(label)
        view.addSubview(backButton)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }

    @objc func backToFirstScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
