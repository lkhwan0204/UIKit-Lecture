import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
   
    func loadWebPage(_ url: String) {
        //URL -> URLRequest -> load
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.navigationDelegate = self
        myWebView.load(myRequest)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebPage("https://2sam.net/")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true
    }
    
    
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }

    @IBAction func btnGotoUrl( sender: UIButton) {
    }

    @IBAction func btnGoSite1( sender: UIButton) {
        loadWebPage ("http://fallinmac.tistory.com")
    }

    @IBAction func btnGoSite2( sender: UIButton) {
        loadWebPage ( "http://blog.2sam.net")
    }

    @IBAction func btnLoadHtmlString( sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }

    @IBAction func btnLoadHtmlFile( sender: UIButton) {
    }

    @IBAction func btnStop( sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }

    @IBAction func btnReload( sender: UIBarButtonItem) {
        myWebView.reload()
    }

    @IBAction func btnGoBack( sender: UIBarButtonItem) {
        myWebView.goBack()
    }

    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }

}
