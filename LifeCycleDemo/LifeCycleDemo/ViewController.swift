import UIKit

/// 다양한 모달 프레젠테이션 스타일을 보여주는 메인 뷰 컨트롤러
/// - 전체화면, 카드형 시트, 폼 시트, 팝오버 등 iOS의 대표적인 모달 스타일 데모
/// - 각 모달은 해당 버튼의 색상을 배경으로 사용하여 시각적 일관성 유지
class ViewController: UIViewController {
    
    // MARK: - UI 컴포넌트
    
    /// 버튼들을 세로로 정렬하는 스택 뷰
    /// - 간격: 20pt
    /// - 오토레이아웃 사용
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    /// 전체화면 모달을 표시하는 버튼
    /// - 스타일: systemBlue 배경, 흰색 텍스트
    /// - 모서리 반경: 8pt
    private lazy var fullScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체화면 모달", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showFullScreenModal), for: .touchUpInside)
        return button
    }()
    
    /// 카드형 시트 모달을 표시하는 버튼
    /// - 스타일: systemGreen 배경, 흰색 텍스트
    /// - 모서리 반경: 8pt
    private lazy var pageSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카드형 시트", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showPageSheetModal), for: .touchUpInside)
        return button
    }()
    
    /// 폼 시트 모달을 표시하는 버튼
    /// - 스타일: systemOrange 배경, 흰색 텍스트
    /// - 모서리 반경: 8pt
    private lazy var formSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("폼 시트", for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showFormSheetModal), for: .touchUpInside)
        return button
    }()
    
    /// 팝오버 모달을 표시하는 버튼 (iPad 최적화)
    /// - 스타일: systemPurple 배경, 흰색 텍스트
    /// - 모서리 반경: 8pt
    private lazy var popoverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("팝오버 (iPad)", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showPopoverModal), for: .touchUpInside)
        return button
    }()

    // MARK: - 생명주기 메서드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI 설정
    
    /// UI 초기 설정을 수행하는 메서드
    /// - 배경색 설정
    /// - 스택뷰 및 버튼 레이아웃 구성
    /// - 오토레이아웃 제약조건 설정
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "모달 스타일 예제"
        
        view.addSubview(stackView)
        [fullScreenButton, pageSheetButton, formSheetButton, popoverButton].forEach {
            stackView.addArrangedSubview($0)
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    // MARK: - 모달 표시 메서드
    
    /// 전체화면 모달을 표시
    /// - crossDissolve 전환 효과 사용
    /// - systemBlue 배경색 적용
    @objc private func showFullScreenModal() {
        let modalVC = ModalContentViewController(title: "전체화면 모달", style: .fullScreen, backgroundColor: .systemBlue)
        modalVC.modalTransitionStyle = .crossDissolve
        present(modalVC, animated: true)
    }
    
    /// 카드형 시트 모달을 표시
    /// - 중간/최대 높이 옵션 제공
    /// - 상단 그래버 표시
    /// - systemGreen 배경색 적용
    @objc private func showPageSheetModal() {
        let modalVC = ModalContentViewController(title: "카드형 시트", style: .pageSheet, backgroundColor: .systemGreen)
        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(modalVC, animated: true)
    }
    
    /// 폼 시트 모달을 표시
    /// - systemOrange 배경색 적용
    @objc private func showFormSheetModal() {
        let modalVC = ModalContentViewController(title: "폼 시트", style: .formSheet, backgroundColor: .systemOrange)
        present(modalVC, animated: true)
    }
    
    /// 팝오버 모달을 표시
    /// - iPad에 최적화된 UI
    /// - 모든 기기에서 팝오버 스타일 유지
    /// - systemPurple 배경색 적용
    @objc private func showPopoverModal() {
        let modalVC = ModalContentViewController(title: "팝오버", style: .popover, backgroundColor: .systemPurple)
        modalVC.popoverPresentationController?.sourceView = popoverButton
        modalVC.popoverPresentationController?.sourceRect = popoverButton.bounds
        modalVC.preferredContentSize = CGSize(width: 300, height: 200)
        modalVC.popoverPresentationController?.delegate = self
        present(modalVC, animated: true)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {
    /// 팝오버 프레젠테이션 스타일 유지를 위한 델리게이트 메서드
    /// - Parameter controller: 프레젠테이션 컨트롤러
    /// - Returns: 항상 .none을 반환하여 팝오버 스타일 유지
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - ModalContentViewController

/// 모달 컨텐츠를 표시하는 뷰 컨트롤러
/// - 타이틀과 닫기 버튼 포함
/// - 커스텀 배경색 지원
class ModalContentViewController: UIViewController {
    
    // MARK: - 프로퍼티
    
    private let modalTitle: String
    private let backgroundColor: UIColor
    
    // MARK: - UI 컴포넌트
    
    /// 모달 타이틀 레이블
    /// - 폰트: Bold 20pt
    /// - 색상: 흰색
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = modalTitle
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// 모달 닫기 버튼
    /// - 스타일: 흰색 텍스트
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닫기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - 초기화
    
    /// 커스텀 이니셜라이저
    /// - Parameters:
    ///   - title: 모달 타이틀
    ///   - style: 모달 프레젠테이션 스타일
    ///   - backgroundColor: 배경색
    init(title: String, style: UIModalPresentationStyle, backgroundColor: UIColor) {
        self.modalTitle = title
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = style
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 생명주기 메서드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI 설정
    
    /// UI 초기 설정을 수행하는 메서드
    /// - 배경색 설정
    /// - 레이블 및 버튼 레이아웃 구성
    private func setupUI() {
        view.backgroundColor = backgroundColor
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            closeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - 액션
    
    /// 모달을 닫는 메서드
    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}

