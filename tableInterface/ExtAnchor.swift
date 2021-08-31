import Foundation
import UIKit

extension UIView {

  func anchorTable(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superView.topAnchor, constant: 150),
      leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
      trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -15),
      bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -160)
      ])
    }
  }
