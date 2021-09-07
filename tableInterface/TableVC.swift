import Foundation
import UIKit

class TableVC: UIViewController {
  private let gradientL = CAGradientLayer()
  private let tableView = UITableView(frame: .zero, style: .insetGrouped)
  private var dataCell: [[DataCell]] = [[]]
  private let titleTable = TitleTableView()
  private let color = UIColor(named: "Color")
  private let colorTwo = UIColor(named: "Color2")
  struct Cells {
    static let tableViewCell = "TableViewCell"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    dataCell = fetchData()
    setupGradient()
    configureTableView()
    self.view.addSubview(titleTable)
  }

 private func fetchData() -> [[DataCell]] {
    let data = [
      [DataCell(image: Images.injection, title: "COVID-19 VACCINATION 1 Dose Public (18+) (Astrazeneca)", subtitle: " "),
        DataCell(image: Images.clock, title: "17 August 2021", subtitle: "Operation time: 08:00 - 14:00"),
        DataCell(image: Images.placeholder, title: "Senggrong Hospital", subtitle: "Bululawang-Senggrong Street, Senggrong Bululawang, Kabupaten Malang")],

      [DataCell(image: Images.user, title: "Muhammad Yanto", subtitle: "3510290928394506"),
        DataCell(image: Images.phone, title: "083123456789", subtitle: " "),
        DataCell(image: Images.placeholder, title: "Maestro Reload Bululawang, Senggrong, Kabupaten Malang", subtitle: " ")]
    ]
    return data
  }

  private func setupGradient() {
    gradientL.frame = self.view.bounds
    gradientL.colors = [#colorLiteral(red: 0.8113234639, green: 0.8905510306, blue: 0.9940212369, alpha: 1).cgColor, #colorLiteral(red: 0.988163054, green: 0.9882777333, blue: 0.9881102443, alpha: 1).cgColor]
    gradientL.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientL.endPoint = CGPoint (x: 1.0, y: 1.0)
    self.view.layer.insertSublayer(gradientL, at: 0)
  }

  private func configureTableView() {
    self.view.addSubview(tableView)
    setTableViewDelegate()
    anchorTable()
    tableView.layer.cornerRadius = 15
    tableView.layer.masksToBounds = true
    tableView.isScrollEnabled = false
    tableView.register(TableViewCell.self, forCellReuseIdentifier: Cells.tableViewCell)
    tableView.backgroundColor = .none
    tableView.separatorStyle = .none
  }


 private func anchorTable() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
      ])
  }


  private func setTableViewDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section > 0 ? 3 : 3
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tableViewCell) as? TableViewCell
    let base = dataCell[indexPath.section][indexPath.row]
    cell?.set(base: base)

    return cell!
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerTable = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
    headerTable.backgroundColor = .none
    let head = HeaderTableView()
    headerTable.addSubview(head)
    return section > 0 ? headerTable : nil

  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 30
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
    let button = FooterTableViewButton()
    footerView.addSubview(button)

    return section > 0 ? footerView : nil

  }

}


