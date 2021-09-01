import Foundation
import UIKit

class TableVC: UIViewController {
  private let gradientL = CAGradientLayer()
  private let tableView = UITableView()
  var base: [Base] = []

  struct Cells {
    static let tableViewCell = "TableViewCell"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    base = fetchData()
    setupGradient()
    configureTableView()
  }

  private func setupGradient() {
    gradientL.frame = self.view.bounds
    gradientL.colors = [UIColor.systemTeal.cgColor, UIColor.systemTeal.cgColor, UIColor.white.cgColor]
    gradientL.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientL.endPoint = CGPoint (x: 1.0, y: 1.0)
    self.view.layer.insertSublayer(gradientL, at: 0)
  }

  private func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegate()
    tableView.anchorTable(to: view)
    tableView.layer.cornerRadius = 15
    tableView.layer.masksToBounds = true
    tableView.register(TableViewCell.self, forCellReuseIdentifier: Cells.tableViewCell)
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
    let base = base[indexPath.row]
    cell.set(base: base)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "section \(section)"
  }

}

extension UIView {
  func anchorTable(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superView.topAnchor, constant: 150),
      leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
      trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -15),
      bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -110)
      ])
  }
}

extension TableVC {

  func fetchData() -> [Base] {
    let cell1 = Base(image: Images.injection, title: "COVID-19 VACCINATION 1 Dose \nPublic (18+) (Astrazeneca)", subtitle: " ")
    let cell2 = Base(image: Images.clock, title: "17 August 2021", subtitle: "Operation time: 08:00 - 14:00")
    let cell3 = Base(image: Images.placeholder, title: "Senggrong Hospital", subtitle: "Bululawang-Senggrong Street, Senggrong \nBululawang, Kabupaten Malang")
    let cell4 = Base(image: Images.user, title: "Muhammad Yanto", subtitle: "3510290928394506")
    let cell5 = Base(image: Images.phone, title: "083123456789", subtitle: " ")
    let cell6 = Base(image: Images.placeholder, title: "Maestro Reload Bululawang, Senggrong, \nKabupaten Malang", subtitle: " ")

    return [cell1, cell2, cell3, cell4, cell5, cell6]
  }
}
