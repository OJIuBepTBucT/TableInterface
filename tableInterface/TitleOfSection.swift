import Foundation
import UIKit

class TitleOfSection: UIView {
  private var titleSection = UILabel()
  
  override init(frame: CGRect) {
      super.init(frame: frame)
    addSubview(titleSection)
    configureTitle()
    setTitle()

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureTitle() {
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    titleSection.numberOfLines = 0
    titleSection.adjustsFontSizeToFitWidth = true
    titleSection.font = bondFont
    titleSection.font = titleSection.font.withSize(30)
    titleSection.text = "OSOAOSOOA"
  }
  
  private func setTitle() {
    titleSection.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleSection.topAnchor.constraint(equalTo: topAnchor, constant: 2),
      titleSection.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
      titleSection.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
      titleSection.heightAnchor.constraint(equalToConstant: 40),
      titleSection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }
  
}
