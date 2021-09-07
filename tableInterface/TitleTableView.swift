import UIKit

class TitleTableView: UIView {
  private let titleTable = UILabel()
  private let subTitleTable = UILabel()
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureTitlaTable()
    configureSubTitle()
    setTitleTable()
    setSubTitle()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureTitlaTable() {
    addSubview(titleTable)
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    titleTable.numberOfLines = 0
    titleTable.font = bondFont
    titleTable.font = titleTable.font.withSize(29)
    titleTable.text = "Register Success"
  }

  private func configureSubTitle() {
    addSubview(subTitleTable)
    subTitleTable.numberOfLines = 0
    subTitleTable.font = subTitleTable.font.withSize(15)
    subTitleTable.textColor = .systemGray
    subTitleTable.text = "Save the ticket as a faccination proof"
  }

  private func setTitleTable() {
    titleTable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleTable.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      titleTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      ])
  }

  private func setSubTitle() {
    subTitleTable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      subTitleTable.topAnchor.constraint(equalTo: titleTable.bottomAnchor, constant: 10),
      subTitleTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      ])
  }
}
