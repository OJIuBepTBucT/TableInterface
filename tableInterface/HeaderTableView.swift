import UIKit

class HeaderTableView: UIView {
  private let label = UILabel(frame: CGRect(x: 0, y: -5, width: 400, height: 30))

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(label)
    configureLabel()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureLabel() {
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    label.numberOfLines = 0
    label.adjustsFontSizeToFitWidth = true
    label.font = bondFont
    label.font = label.font.withSize(20)
    label.text = "Registrant Detail"
  }


}
