//
//  ViewController.swift
//  FollowMyFinger
//
//  Created by Roman Dod on 7/21/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let widthHeight: CGFloat = 100
    let circleV: UIView! = nil
    
    lazy var circleView = createView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(circleView)
        
        let gest = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        circleView.addGestureRecognizer(gest)
        
        
    }
    
    
//    @objc private func handlePan(_ gesture: UITapGestureRecognizer) {
//
//        switch gesture.state {
//        case .began:
//            let tap = UITapGestureRecognizer(target: self, action: #selector(createView(_:)))
//            view.addGestureRecognizer(tap)
//        case .changed:
//
//        default:
//            <#code#>
//        }
//    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer){
 
       
//            var point = circleView.convert(gesture.translation(in: circleView), to: self.view)
//            print(point)
//            circleView.center = gesture.translation(in: circleView)
//            print(gesture.translation(in: circleView))
//            gesture.setTranslation(gesture.translation(in: circleView), in: view)
            if gesture.state == .began || gesture.state == .changed {

                let translation = gesture.translation(in: self.view)
                // note: 'view' is optional and need to be unwrapped
                gesture.view!.center = CGPoint(x: gesture.view!.center.x + translation.x, y: gesture.view!.center.y + translation.y)
                gesture.setTranslation(CGPoint.zero, in: self.view)
            }

       
    }
   
    
    private func createView() -> UIView{
        
        let x = CGFloat.random(in: 0...view.frame.size.width - widthHeight)
        let y = CGFloat.random(in: 0...view.frame.size.height - widthHeight)
        
        let circleView = UIView(frame: CGRect(x: x, y: y, width: widthHeight, height: widthHeight))
        
        circleView.backgroundColor = randomColor()
        circleView.layer.cornerRadius = widthHeight / 2
        
        return circleView
    }
    

    
//    @objc private func createView(_ touches: UITouch) -> UIView {
//
//        let circleView = UIView()
//
//        circleView.frame = CGRect(x: touches.location(in: view).x, y: touches.location(in: view).y, width: widthHeight, height: widthHeight)
//        circleView.backgroundColor = randomColor()
//        circleView.layer.cornerRadius = widthHeight / 2
//        view.addSubview(circleView)
//
//        return circleView
//    }
    
    func randomColor() -> UIColor{
       return UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
    
}

