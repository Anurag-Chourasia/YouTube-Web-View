//
//  ViewController.swift
//  YouTubeWebView
//
//  Created by Anurag Chourasia on 10/02/23.
//

import UIKit

//import webkit for using webkit
import WebKit
class ViewController: UIViewController,WKUIDelegate, WKNavigationDelegate, UIGestureRecognizerDelegate{
//    var twoFingerSwipeDownRecognizer: UISwipeGestureRecognizer?
      
    //created an iboutlet for webkit
      @IBOutlet var webViewKit: WKWebView!
      
      override func viewDidLoad() {
          super.viewDidLoad()
      
          // added gestures for swipe right
          let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
          swipeRight.direction = .right
          self.webViewKit.addGestureRecognizer(swipeRight)
          
          
          // added gestures for swipe left
          let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
          swipeLeft.direction = .left
          self.webViewKit.addGestureRecognizer(swipeLeft)
          
          
          //gesture for two finger swipe
          
//          let twoFingerSwipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didRecognizeTwoFingerSwipeDown))
//          twoFingerSwipeDownRecognizer.numberOfTouchesRequired = 2
//          twoFingerSwipeDownRecognizer.direction = .right
//          webViewKit?.addGestureRecognizer(twoFingerSwipeDownRecognizer)
          
//          self.twoFingerSwipeDownRecognizer = twoFingerSwipeDownRecognizer

          //assign delegate
          
          webViewKit.uiDelegate = self

          //change the safe area color
          view.backgroundColor = UIColor(red: 18/255, green: 52/255, blue: 90/255, alpha: 1.0)
              
          //load your url like this
          let myURL = URL(string:"https://www.youtube.com")
          let myRequest = URLRequest(url: myURL!)
          self.webViewKit.load(myRequest)
             
         }
      
    //created an objc function for gesture recognising
      @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

          if let swipeGesture = gesture as? UISwipeGestureRecognizer {

              switch swipeGesture.direction {
                  
              case .right:
                  if(webViewKit.canGoBack){
                      webViewKit.goBack()
                  }else{
                      //you can edit the code and use it to go back to previous view.
                      webViewKit.reload()
                  }
                  
              case .left:
                  if(webViewKit.canGoForward){
                      webViewKit.goForward()
                  }else{
                      webViewKit.reload()
                  }
              
                  
              default:
                  break
                  
              }
          }
      }
      
    //to include two finger gesture.
    
//      @objc func didRecognizeTwoFingerSwipeDown(recognizer: UISwipeGestureRecognizer) {
//              let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController
//          self.navigationController?.pushViewController(vc!, animated: true)
//          }
      
  }
