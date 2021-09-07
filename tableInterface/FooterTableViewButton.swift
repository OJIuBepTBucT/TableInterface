import UIKit

class FooterTableViewButton: UIView {
 private let footerButton = UIButton(type: .custom)

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(footerButton)
    configureButton()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureButton() {
    footerButton.setTitle("Save Ticket", for: .normal)
    footerButton.setTitleColor(UIColor.white, for: .normal)
    footerButton.backgroundColor = UIColor.systemTeal
    footerButton.layer.cornerRadius = 15
    footerButton.layer.masksToBounds = true
    footerButton.frame = CGRect(x: 5, y: 45, width: 370, height: 60)
  }
}
