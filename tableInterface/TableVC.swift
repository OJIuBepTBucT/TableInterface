import Foundation
import UIKit

class TableVC: UIViewController {
  private let gradientL = CAGradientLayer()
  private let tableView = UITableView()
  var dataCell: [DataCell] = []

  struct Cells {
    static let tableViewCell = "TableViewCell"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    dataCell = fetchData()
    setupGradient()
    configureTableView()
  }

  func fetchData() -> [DataCell] {
    return [
      DataCell(image: Images.injection, title: "COVID-19 VACCINATION 1 Dose \nPublic (18+) (Astrazeneca)", subtitle: " "),
      DataCell(image: Images.clock, title: "17 August 2021", subtitle: "Operation time: 08:00 - 14:00"),
      DataCell(image: Images.placeholder, title: "Senggrong Hospital", subtitle: "Bululawang-Senggrong Street, Senggrong \nBululawang, Kabupaten Malang"),
      DataCell(image: Images.user, title: "Muhammad Yanto", subtitle: "3510290928394506"),
      DataCell(image: Images.phone, title: "083123456789", subtitle: " "),
      DataCell(image: Images.placeholder, title: "Maestro Reload Bululawang, Senggrong, \nKabupaten Malang", subtitle: " ")]
  }

  private func setupGradient() {
    gradientL.frame = self.view.bounds
    gradientL.colors = [UIColor.systemTeal.cgColor, UIColor.systemTeal.cgColor, UIColor.white.cgColor]
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
    tableView.register(TableViewCell.self, forCellReuseIdentifier: Cells.tableViewCell)
  }
  

    func anchorTable() {
      tableView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
        ])
    }
  

  private func setTableViewDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section > 0 ? 4 : 3
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tableViewCell) as! TableViewCell
    let base = dataCell[indexPath.row]
    cell.set(base: base)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "section \(section)"
  }

}


