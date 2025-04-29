import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func setupAudioPlayer() {
        // 오디오 소스파일 url 준비
        // audioPlayer 인스턴트 생성
        guard let url = Bundle.main.url(forResource: "LetItBeMe", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print("오디오 플레이어 초기화 실패: \(error)")
        }
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        audioPlayer?.play()
    }
    
    @IBAction func pauseAudio(_ sender: UIButton) {
        audioPlayer?.pause()
    }

    @IBAction func stopAudio(_ sender: UIButton) {
        audioPlayer?.stop()
    }
    
    @objc func updateTime() {
        let minutes = Int(audioPlayer?.currentTime ?? 0) / 60
        let seconds = Int(audioPlayer?.currentTime ?? 0) % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
