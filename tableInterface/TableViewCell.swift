import UIKit

class TableViewCell: UITableViewCell {
  private var icon = UIImageView()
  private var titleLable = UILabel()
  private var underText = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    addSubview(icon)
    icon.layer.cornerRadius = 10
    icon.clipsToBounds = true
    icon.contentMode = .scaleAspectFit
  }

  private func configureTitle() {
    addSubview(titleLable)
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    titleLable.numberOfLines = 0
    titleLable.font = bondFont
    titleLable.font = titleLable.font.withSize(13)
  }

  private func configureUnderText() {
    addSubview(underText)
    underText.numberOfLines = 0
    underText.font = underText.font.withSize(12)
    underText.textColor = .systemGray
  }

  private func setIcon() {
    icon.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      icon.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      icon.heightAnchor.constraint(equalToConstant: 30),
      icon.widthAnchor.constraint(equalToConstant: 30),
      ])
  }

  private func setTitle() {
    titleLable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      titleLable.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 30),
      titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
      ])
  }

  private func setUnderText() {
    underText.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      underText.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
      underText.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 30),
      underText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      underText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
      ])
  }
}
