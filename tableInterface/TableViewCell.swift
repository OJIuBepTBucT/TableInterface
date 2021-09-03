import UIKit

class TableViewCell: UITableViewCell {
  private var icon = UIImageView()
  private var titleLable = UILabel()
  private var underText = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(icon)
    addSubview(titleLable)
    addSubview(underText)

    configureIcon()
    configureUnderText()
    configureTitle()
    setIcon()
    setTitle()
    setUnderText()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func set(base: DataCell) {
    icon.image = base.image
    titleLable.text = base.title
    underText.text = base.subtitle
  }

  private func configureIcon() {
    icon.layer.cornerRadius = 10
    icon.clipsToBounds = true
    icon.adjustsImageSizeForAccessibilityContentSizeCategory = true
  }

  private func configureTitle() {
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    titleLable.numberOfLines = 0
    titleLable.adjustsFontSizeToFitWidth = true
    titleLable.font = bondFont.withSize(30)
  }

  private func configureUnderText() {
    underText.numberOfLines = 0
    underText.adjustsFontSizeToFitWidth = true
    underText.font = underText.font.withSize(15)
    underText.textColor = .systemGray
  }

  private func setIcon() {
    icon.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      icon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
      icon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      icon.heightAnchor.constraint(equalToConstant: 20),
      icon.widthAnchor.constraint(equalToConstant: 20),
      icon.bottomAnchor.constraint(equalTo: icon.bottomAnchor, constant: 25)
      ])
  }

  private func setTitle() {
    titleLable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      titleLable.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
      titleLable.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 30),
      titleLable.heightAnchor.constraint(equalToConstant: 30),
      titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6)
      ])
  }

  private func setUnderText() {
    underText.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      underText.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
      underText.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 30),
      underText.heightAnchor.constraint(equalToConstant: 30),
      underText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }
}
