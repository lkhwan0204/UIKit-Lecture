import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var goBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondViewController - viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController - viewWillAppear")
    }

    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
