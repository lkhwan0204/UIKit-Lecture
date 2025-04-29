import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var alarmTime: String? // 사용자가 설정한 알람 시간
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 설정
        datePicker.datePickerMode = .time // 시간 선택 모드
        datePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)

        // 1초마다 현재 시간을 체크하는 타이머 실행
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    // 사용자가 알람 시간을 설정할 때 호출되는 함수
    @objc func timeChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa" // 12시간 형식 + AM/PM
        alarmTime = formatter.string(from: sender.date) // 알람 시간 저장
        print("설정된 알람 시간: \(alarmTime!)")
    }
    
    // 매초 현재 시간을 확인하는 함수
    @objc func updateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: Date()) // 현재 시간 가져오기
        
        print("현재 시간: \(currentTime)")

        if let alarm = alarmTime, alarm == currentTime {
            view.backgroundColor = UIColor.red // 알람 시간이 되면 배경색 변경
        } else {
            view.backgroundColor = UIColor.white // 기본 배경색
        }
    }
}
