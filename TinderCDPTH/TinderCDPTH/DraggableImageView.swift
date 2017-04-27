//
//  DraggableImageView.swift
//  TinderCDPTH
//
//  Created by Niraj Pendal on 4/26/17.
//  Copyright © 2017 Niraj. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    var initialPoint:CGPoint!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "CustomView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        self.imageView.image = UIImage(named: "ryan")
            
            // custom initialization logic
      //  ...
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("began")
            self.initialPoint = contentView.center
            
        case .changed:
            print("changed")
            let transation = sender.translation(in: contentView)
           // let velocity = sender.velocity(in: contentView)
            let location  = sender.location(in: contentView)
            
            var rotationDegrees = transation.x.degreesToRadians / 50
            
            if location.y > initialPoint.y {
                rotationDegrees = rotationDegrees * -1
            }
            
            if (transation.x > 50) {
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageView.center.x = self.contentView.bounds.width + self.imageView.bounds.width;
                })
            }
            else if (transation.x < -50) {
                UIView.animate(withDuration: 0.5, animations: {
                    self.imageView.center.x = -self.imageView.bounds.width;
                })
            } else {
                self.imageView.transform = CGAffineTransform.identity
                self.imageView.center = self.initialPoint
            }
//            self.contentView.center = CGPoint(x:self.initialPoint!.x + transation.x, y:self.initialPoint!.y)
            //print(transation.x.degreesToRadians * 10)
            //if velocity.x > 0 {
                // clock wise
                //self.contentView.transform = CGAffineTransform(rotationAngle: transation.x.degreesToRadians)
                self.imageView.transform = self.imageView.transform.rotated(by: rotationDegrees)
            //} else {
                // counter clock-wise
                
//            }

        case .ended,.cancelled:
            print("ended")
           // self.contentView.transform =
            self.contentView.center = self.initialPoint!
        default:
            print("")
        }
    }
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
