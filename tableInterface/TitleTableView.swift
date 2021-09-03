import UIKit

class TitleTableView: UIView {

  let titleTable = UILabel()
  let subTitleTable = UILabel()
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(titleTable)
    addSubview(subTitleTable)
    setTitleTable()
    configureTitlaTable()
    configureSubTitle()
    setSubTitle()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureTitlaTable() {
    let bondFont = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
    titleTable.numberOfLines = 0
    titleTable.adjustsFontSizeToFitWidth = true
    titleTable.font = bondFont
    titleTable.text = "Register Success"
  }

  private func configureSubTitle() {
    subTitleTable.numberOfLines = 0
    subTitleTable.adjustsFontSizeToFitWidth = true
    subTitleTable.font = subTitleTable.font.withSize(15)
    subTitleTable.textColor = .systemGray
    subTitleTable.text = "Save the ticket as a faccination proof"
  }

  private func setTitleTable() {
    titleTable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleTable.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      titleTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      titleTable.heightAnchor.constraint(equalToConstant: 30)
      ])
  }

  private func setSubTitle() {
    subTitleTable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      subTitleTable.topAnchor.constraint(equalTo: titleTable.bottomAnchor),
      subTitleTable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      subTitleTable.heightAnchor.constraint(equalToConstant: 30)
      ])
  }
}
