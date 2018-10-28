//
//  TargetView.swift
//  TargetViewPractice
//
//  Created by 陳裕銘 on 2018/10/23.
//  Copyright © 2018 yuming. All rights reserved.
//

import UIKit
    @IBDesignable
    class TargetView: UIView {
        @IBInspectable
        var scale: CGFloat = 0.9
        @IBInspectable
        var circleLineWidth: CGFloat = 5.0
        @IBInspectable
        
        var circleColor: UIColor = UIColor.init(red: 154/255, green: 205/255, blue: 50/255, alpha: 1)
        
         var circleRadius: CGFloat {
            
            return min(bounds.size.width, bounds.size.height) / 2 * scale
        }
        
         var circleCenter: CGPoint {
            let circleY: CGFloat = bounds.height * 0.33
            return CGPoint(x: bounds.midX, y: circleY)
        }
         var leftEyesCenter: CGPoint {
            let leftEyeX: CGFloat = circleCenter.x - circleRadius/3
            let leftEyeY: CGFloat = circleCenter.y - circleRadius/3
            return CGPoint(x: leftEyeX, y: leftEyeY)
        }
        
         var rightEyesCenter: CGPoint {
            let rightEyeX: CGFloat = circleCenter.x + circleRadius/3
            let rightEyeY: CGFloat = circleCenter.y - circleRadius/3
            return CGPoint(x: rightEyeX, y: rightEyeY)
        }
        
         var leftUpBodyPoint: CGPoint {
            let leftUpX: CGFloat = circleCenter.x - circleRadius/1.5
            let leftUpY: CGFloat = circleCenter.y
            
            return CGPoint(x: leftUpX, y: leftUpY)
        }
 
        
         var rightUpBodyPoint: CGPoint {
            let rightUpX: CGFloat = circleCenter.x + circleRadius/1.5
            let rightUpY: CGFloat = circleCenter.y
            
            return CGPoint(x: rightUpX, y: rightUpY)
        }
        
         var bodyRect: CGRect {
            let bodyWidth: CGFloat = circleRadius * 2 / 1.5
            let bodyHeight: CGFloat = circleRadius * 1.3
            return CGRect(x: leftUpBodyPoint.x, y: leftUpBodyPoint.y, width: bodyWidth, height: bodyHeight)
        }
        
         var leftFootPoint: CGPoint{
            let leftFootX:CGFloat = (circleCenter.x + leftUpBodyPoint.x) / 2
            let leftFootY:CGFloat = leftUpBodyPoint.y + bodyRect.height
            return CGPoint(x: leftFootX, y: leftFootY)
        }
        
         var rightFootPoint:CGPoint{
            let rightFootX: CGFloat = (circleCenter.x + rightUpBodyPoint.x) / 2
            let rightFootY: CGFloat = circleCenter.y + bodyRect.height
            return CGPoint(x: rightFootX, y: rightFootY)
        }
//
        func pathForCircle() -> UIBezierPath {
            let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius/1.5 ,startAngle: 0, endAngle: 1 * CGFloat.pi, clockwise: false)
            path.lineWidth = circleLineWidth
           
            
            return path
        }
        
        
//        func pathForCross() -> UIBezierPath {
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: circleCenter.x - circleRadius * 0.8, y:
//                circleCenter.y))
//            path.addLine(to: CGPoint(x: circleCenter.x + circleRadius * 0.8, y:
//                circleCenter.y))
//            path.move(to: CGPoint(x: circleCenter.x, y: circleCenter.y - circleRadius
//                * 0.8))
//            path.addLine(to: CGPoint(x: circleCenter.x, y: circleCenter.y +
//                circleRadius * 0.8))
//            path.lineWidth = 3.0
//            return path
//        }
        
        
        func pathForNeck() -> UIBezierPath {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: circleCenter.x - circleRadius,  y:
                circleCenter.y))
            path.addLine(to: CGPoint(x: circleCenter.x + circleRadius , y:
                circleCenter.y))
            path.lineWidth = 20.0 * scale
            
            return path
        }
        func pathForleftEyes() -> UIBezierPath{
            let path = UIBezierPath(arcCenter: leftEyesCenter, radius: circleRadius/16 ,startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            path.lineWidth = 1.0
            
            path.stroke(with: .clear, alpha: 1)
            
            return path
        }
        func pathForRightEyes() -> UIBezierPath{
            let path = UIBezierPath(arcCenter: rightEyesCenter, radius: circleRadius/16 ,startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            path.lineWidth = 1.0
            
            path.stroke(with: .clear, alpha: 1)
            
            return path
        }
        
        func pathForLeftHair() -> UIBezierPath {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: leftEyesCenter.x, y:
                leftEyesCenter.y - circleRadius*0.25))
            path.addLine(to: CGPoint(x: leftEyesCenter.x - circleRadius/10, y:
                circleCenter.y - circleRadius*0.8))
            
            path.lineWidth = 10.0 * scale
            path.lineCapStyle = .round
            return path
        }
        
        func pathForRightHair() -> UIBezierPath {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: rightEyesCenter.x, y:
                rightEyesCenter.y - circleRadius*0.25))
            path.addLine(to: CGPoint(x: rightEyesCenter.x + circleRadius/10, y:
                circleCenter.y - circleRadius*0.8))
            
            path.lineWidth = 10.0 * scale
            path.lineCapStyle = .round
            return path
        }
        
        func bodyAndBottomCorner() -> UIBezierPath{
//            let path = UIBezierPath(rect: bodyRect)
            let pathForBottomCorner = UIBezierPath(roundedRect: bodyRect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 30.0 * scale, height: 30.0 * scale))
            
//
            
//            path.move(to: leftUpBodyPoint)
//            path.addLine(to: leftDownBodyPoint)
//            path.addLine(to: rightDownBodyPoint)
//            path.addLine(to: rightUpBodyPoint)
//            path.close()
            pathForBottomCorner.lineWidth = 2.0

            

            
            return pathForBottomCorner
        }
        
        func pathForLeftHand() -> UIBezierPath{
            let path = UIBezierPath()
            path.move(to: CGPoint(x: leftUpBodyPoint.x - 0.2 * circleRadius, y: circleCenter.y + 0.1 * circleRadius))
            path.addLine(to: CGPoint(x: leftUpBodyPoint.x - 0.2 * circleRadius , y: circleCenter.y + 0.6 * bodyRect.height))
            path.lineWidth = circleRadius * 0.34
            path.lineCapStyle = .round
            return path
        }
        
        func pathForRightHand() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rightUpBodyPoint.x + 0.2 * circleRadius, y: circleCenter.y + 0.1 * circleRadius))
        path.addLine(to: CGPoint(x: rightUpBodyPoint.x + 0.2 * circleRadius , y: circleCenter.y + 0.6 * bodyRect.height))
        path.lineWidth = circleRadius / 3
        path.lineCapStyle = .round
        return path
        }
        
        func pathForLeftFoot() -> UIBezierPath{
            let path = UIBezierPath()
            path.move(to: leftFootPoint)
            path.addLine(to: CGPoint(x: leftFootPoint.x, y: leftFootPoint.y + 70 * scale))
            path.lineWidth = circleRadius / 3
            path.lineCapStyle = .round
            return path
        }
        
        func pathForRightFoot() -> UIBezierPath{
            let path = UIBezierPath()
            path.move(to: rightFootPoint)
            path.addLine(to: CGPoint(x: rightFootPoint.x , y: rightFootPoint.y + 70 * scale))
            path.lineWidth = circleRadius / 3
            path.lineCapStyle = .round
            return path
        }
        

        override func draw(_ rect: CGRect) {
            
            // Draw a Circle
            circleColor.setFill()
            pathForCircle().fill()
            
            // Draw a circleStroke
            circleColor.setStroke()
            pathForCircle().stroke()
            
            // Draw a neck
            UIColor.white.setStroke()
            pathForNeck().stroke()
            
            // Draw left Eye
            UIColor.white.setStroke()
            pathForleftEyes().stroke()
            UIColor.white.setFill()
            pathForleftEyes().fill()
            
            // Draw right Eye
            
            UIColor.white.setFill()
            pathForRightEyes().fill()
            
            // Draw left Hair
            circleColor.setStroke()
         pathForLeftHair().stroke()
            
            // Draw left Hair
            circleColor.setStroke()
            pathForRightHair().stroke()
            
            // Draw BodyAndBottomCorner
            circleColor.setFill()
            bodyAndBottomCorner().fill()
            
            // Draw leftHand
            circleColor.setStroke()
            pathForLeftHand().stroke()
//            circleColor.setStroke()
//            bodyAndBottoRightCorner().stroke()
//
            // Draw rightHand
            circleColor.setStroke()
            pathForRightHand().stroke()
           
            // Draw leftFoot
            circleColor.setStroke()
            pathForLeftFoot().stroke()
            
            // Draw rightFoot
            circleColor.setStroke()
            pathForRightFoot().stroke()
            
        }
    }



