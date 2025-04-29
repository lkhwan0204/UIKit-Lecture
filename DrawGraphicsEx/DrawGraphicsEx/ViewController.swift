import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var lastPoint: CGPoint? // 터치 시작 위치 저장
    var isDrawing = false   // 그리기 여부
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 선 그리기 (기존)
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 50, y: 50))
        context.addLine(to: CGPoint(x: 250, y: 250))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 사각형 그리기 (기존)
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(3.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        let rect = CGRect(x: 50, y: 100, width: 200, height: 150)
        context.addRect(rect)
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 원 그리기 (기존)
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        let rect = CGRect(x: 100, y: 150, width: 150, height: 150)
        context.addEllipse(in: rect)
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 호(Arc) 그리기 (기존)
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.orange.cgColor)
        
        context.addArc(center: CGPoint(x: 150, y: 250),
                       radius: 80,
                       startAngle: 0,
                       endAngle: CGFloat.pi,
                       clockwise: true)
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // 채워진 도형 그리기 (기존)
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setFillColor(UIColor.purple.cgColor)
        
        let rect = CGRect(x: 70, y: 120, width: 180, height: 120)
        context.addRect(rect)
        context.fillPath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // **터치 기반 드로잉 추가**
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: imgView)
            isDrawing = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isDrawing { return }
        guard let touch = touches.first, let lastPoint = lastPoint else { return }
        
        let currentPoint = touch.location(in: imgView)
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        imgView.image?.draw(in: imgView.bounds)
        
        context?.setLineWidth(3.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.setLineCap(.round)
        
        context?.move(to: lastPoint)
        context?.addLine(to: currentPoint)
        context?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
    }
    
    // 캔버스 초기화
    @IBAction func btnClear(_ sender: UIButton) {
        imgView.image = nil
    }
}
