import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imgView: UIImageView!
    
    // UIImagePicker 인스턴스 변수
    let imagePicker = UIImagePickerController()
    // 불러온 사진
    var captureImage: UIImage!
    // URL 저장
    var videoURL: URL!
    // 이미지 저장 여부
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 사진 촬영 버튼
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImageSave = true
            presentImagePicker(sourceType: .camera, mediaType: .photo)
        } else {
            myAlert("Capture Image Error!", message: "사진 촬영 기능을 실행할 수 없습니다!")
        }
    }
    
    // 사진 불러오기 버튼
    @IBAction func btnLoadImageFromLibray(_ sender: UIButton) {
        presentImagePicker(sourceType: .photoLibrary, mediaType: .photo)
    }
    
    // 비디오 촬영 버튼
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        presentImagePicker(sourceType: .camera, mediaType: .video)
    }
    
    // 비디오 불러오기 버튼
    @IBAction func btnLoadVideoFromLibray(_ sender: UIButton) {
        presentImagePicker(sourceType: .photoLibrary, mediaType: .video)
    }
    
    // 경고 메시지 표시 함수
    func myAlert(_ title: String, message: String) {
        print("\(title): \(message)")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
    // 미디어 타입을 나타내는 enum 정의
    enum MediaType {
        case photo  // 사진
        case video  // 비디오
    }

    // 이미지 피커를 표시하는 함수
    func presentImagePicker(sourceType: UIImagePickerController.SourceType, mediaType: MediaType) {
        // 선택한 소스 타입이 사용 가능한지 확인
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            showAlert(message: "해당 기능을 사용할 수 없습니다.")
            return
        }

        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType

        // 미디어 타입 설정
        switch mediaType {
        case .photo:
            picker.mediaTypes = ["public.image"]
        case .video:
            picker.mediaTypes = ["public.movie"]
        }

        present(picker, animated: true)
    }

    // 경고 메시지 표시 함수
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }

    // 사용자가 사진 또는 비디오를 선택한 후 호출되는 델리게이트 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imgView.image = selectedImage // 선택한 이미지 표시
        } else if let selectedVideoURL = info[.mediaURL] as? URL {
            showAlert(message: "비디오가 선택되었습니다: \(selectedVideoURL.lastPathComponent)")
        }
        picker.dismiss(animated: true)
    }

    // 사용자가 취소 버튼을 눌렀을 때 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
