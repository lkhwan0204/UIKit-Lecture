import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "FirstViewController - viewDidLoad"
        print("FirstViewController - viewDidLoad")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        statusLabel.text = "FirstViewController - viewDidAppear"
        print("FirstViewController - viewDidAppear")
    }
}
