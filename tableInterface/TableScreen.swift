import Foundation
import UIKit

class TableScreen: UIViewController {
    let gradientL = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }
    
    func setupGradient() {
        gradientL.frame = self.view.bounds
        gradientL.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        gradientL.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientL.endPoint = CGPoint (x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientL, at: 0)
    }
  
    
}
