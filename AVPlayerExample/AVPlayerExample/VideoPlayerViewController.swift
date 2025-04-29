import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
    }

    func setupPlayer() {
        guard let path = Bundle.main.path(forResource: "sample_video", ofType: "mp4") else { return }
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)

        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        view.layer.insertSublayer(playerLayer!, below: playPauseButton.layer)
    }

    @IBAction func playPauseTapped(_ sender: UIButton) {
        if player?.rate == 0 {
            player?.play()
            playPauseButton.setTitle("Pause", for: .normal)
        } else {
            player?.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }
    }

    @IBAction func speedSliderChanged(_ sender: UISlider) {
        let newRate = sender.value
        player?.rate = newRate
    }
}
