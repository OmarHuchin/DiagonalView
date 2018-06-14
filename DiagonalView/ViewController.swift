//
//  ViewController.swift
//  DiagonalView
//
//  Created by Omar Huchin on 13/06/18.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

@IBDesignable
class AngleView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.blue { didSet { setNeedsLayout() } }
    @IBInspectable var angleDirection : Int = 0
        /*{didSet(newValue){
            if newValue == 0{
                points = leftPoints
            }else{
                points = rightPoints
            }
            setNeedsLayout()
        }}*/
    var leftPoints = [
        CGPoint(x: 1, y: 0),
        CGPoint.zero,
        CGPoint(x: 0, y: 1),
        CGPoint(x: 1, y: 0.5)
    ]
    var rightPoints = [
        CGPoint.zero,
        CGPoint(x: 1, y: 0),
        CGPoint(x: 1, y: 1),
        CGPoint(x: 0, y: 0.5)
    ]
    var points =  [
        CGPoint(x: 1, y: 0),
        CGPoint.zero,
        CGPoint(x: 0, y: 0.7),
        CGPoint(x: 1, y: 0.3)
        ]{ didSet(newValue) {
            setNeedsLayout()
        }
    }
    
   
    private lazy var shapeLayer: CAShapeLayer = {
        let _shapeLayer = CAShapeLayer()
        self.layer.insertSublayer(_shapeLayer, at: 0)
        return _shapeLayer
    }()

    override func layoutSubviews() {
        shapeLayer.fillColor = fillColor.cgColor
        
        let path = UIBezierPath()
        
        path.move(to: convert(relativePoint: points[0]))
        for point in points.dropFirst() {
            path.addLine(to: convert(relativePoint: point))
        }
        path.close()
        
        shapeLayer.path = path.cgPath
    }
    
    private func convert(relativePoint point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * bounds.width + bounds.origin.x, y: point.y * bounds.height + bounds.origin.y)
    }
}

