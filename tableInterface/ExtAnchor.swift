import Foundation
import UIKit

extension UIView {

  func anchorTable(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: topAnchor, constant: 10),
      leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
      trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
      bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
      ])
    }
  }
