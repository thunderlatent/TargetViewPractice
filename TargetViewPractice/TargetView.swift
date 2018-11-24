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
    
    @IBInspectable var scale: CGFloat = 0.9
    
    @IBInspectable var circleLineWidth: CGFloat = 5.0
    
    @IBInspectable var circleColor: UIColor = UIColor.init(red: 154/255, green: 205/255, blue: 50/255, alpha: 1)
    
    
    
     override func draw(_ rect: CGRect) {
        
        var circleRadius: CGFloat {
            var myRadius : CGFloat = 0.0
            let width = bounds.width
            let height = bounds.height
            if width > height{
                myRadius = height * 0.75
                print("橫向")
                print("目前高：\(bounds.height)")
                    print("目前寬:\(bounds.width)")
                print(myRadius)
            }else if height > width
            {
                myRadius = width
                print("直立")
                print("目前高：\(bounds.height)")
                print("目前寬:\(bounds.width)")
                print("回傳半徑：\(myRadius)")
            }
            //        return min(bounds.size.width, bounds.size.height) / 2 * scale
            
            return myRadius / 2 * scale
        }
    print("最終半徑：\(circleRadius)")
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
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
   
        
      
        
        // Draw a Circle
        let pathForCircle = UIBezierPath(arcCenter: circleCenter, radius: circleRadius/1.5 ,startAngle: 0, endAngle: 1 * CGFloat.pi, clockwise: false)
        pathForCircle.lineWidth = circleLineWidth
        circleColor.setFill()
        pathForCircle.fill()
        
        
        
        
        // Draw a neck
        let pathForNeck = UIBezierPath()
        pathForNeck.move(to: CGPoint(x: circleCenter.x - circleRadius,  y:
            circleCenter.y))
        pathForNeck.addLine(to: CGPoint(x: circleCenter.x + circleRadius , y:
            circleCenter.y))
        pathForNeck.lineWidth = 20.0 * scale
        UIColor.white.setStroke()
        pathForNeck.stroke()
        
        // Draw left Eye
        let pathForleftEyes = UIBezierPath(arcCenter: leftEyesCenter, radius: circleRadius/16 ,startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        pathForleftEyes.lineWidth = 1.0
        UIColor.white.setFill()
        pathForleftEyes.fill()
        
        // Draw right Eye
        let pathForRightEyes = UIBezierPath(arcCenter: rightEyesCenter, radius: circleRadius/16 ,startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        pathForRightEyes.lineWidth = 1.0
        UIColor.white.setFill()
        pathForRightEyes.fill()
        
        // Draw left Hair
        let pathForLeftHair = UIBezierPath()
        pathForLeftHair.move(to: CGPoint(x: leftEyesCenter.x, y:
            leftEyesCenter.y - circleRadius*0.25))
        pathForLeftHair.addLine(to: CGPoint(x: leftEyesCenter.x - circleRadius/10, y:
            circleCenter.y - circleRadius*0.8))
        
        pathForLeftHair.lineWidth = 10.0 * scale
        pathForLeftHair.lineCapStyle = .round
        
        circleColor.setStroke()
        pathForLeftHair.stroke()
        
        // Draw right Hair
        let pathForRightHair = UIBezierPath()
        pathForRightHair.move(to: CGPoint(x: rightEyesCenter.x, y:
            rightEyesCenter.y - circleRadius*0.25))
        pathForRightHair.addLine(to: CGPoint(x: rightEyesCenter.x + circleRadius/10, y:
            circleCenter.y - circleRadius*0.8))
        
        pathForRightHair.lineWidth = 10.0 * scale
        pathForRightHair.lineCapStyle = .round
        
        circleColor.setStroke()
        pathForRightHair.stroke()
        
        // Draw BodyAndBottomCorner
        let pathForBottomCorner = UIBezierPath(roundedRect: bodyRect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 30.0 * scale, height: 30.0 * scale))
        pathForBottomCorner.lineWidth = 2.0
        circleColor.setFill()
        pathForBottomCorner.fill()
        
        // Draw leftHand
        let pathForLeftHand = UIBezierPath()
        pathForLeftHand.move(to: CGPoint(x: leftUpBodyPoint.x - 0.2 * circleRadius, y: circleCenter.y + 0.1 * circleRadius))
        pathForLeftHand.addLine(to: CGPoint(x: leftUpBodyPoint.x - 0.2 * circleRadius , y: circleCenter.y + 0.6 * bodyRect.height))
        pathForLeftHand.lineWidth = circleRadius * 0.34
        pathForLeftHand.lineCapStyle = .round
        circleColor.setStroke()
        pathForLeftHand.stroke()
        
        
        
        // Draw rightHand
        let pathForRightHand = UIBezierPath()
        pathForRightHand.move(to: CGPoint(x: rightUpBodyPoint.x + 0.2 * circleRadius, y: circleCenter.y + 0.1 * circleRadius))
        pathForRightHand.addLine(to: CGPoint(x: rightUpBodyPoint.x + 0.2 * circleRadius , y: circleCenter.y + 0.6 * bodyRect.height))
        pathForRightHand.lineWidth = circleRadius / 3
        pathForRightHand.lineCapStyle = .round
        circleColor.setStroke()
        pathForRightHand.stroke()
        
        // Draw leftFoot
        let pathForLeftFoot = UIBezierPath()
        pathForLeftFoot.move(to: leftFootPoint)
        pathForLeftFoot.addLine(to: CGPoint(x: leftFootPoint.x, y: leftFootPoint.y + bounds.height * 0.1 * scale))
        pathForLeftFoot.lineWidth = circleRadius / 3
        pathForLeftFoot.lineCapStyle = .round
        circleColor.setStroke()
        pathForLeftFoot.stroke()
        
        // Draw rightFoot
        let pathForRightFoot = UIBezierPath()
        pathForRightFoot.move(to: rightFootPoint)
        pathForRightFoot.addLine(to: CGPoint(x: rightFootPoint.x , y: rightFootPoint.y + bounds.height * 0.1 * scale))
        pathForRightFoot.lineWidth = circleRadius / 3
        pathForRightFoot.lineCapStyle = .round
        circleColor.setStroke()
        pathForRightFoot.stroke()
        
    }
}



