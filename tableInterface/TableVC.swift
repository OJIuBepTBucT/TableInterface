import Foundation
import UIKit

class TableVC: UIViewController {
  private let gradientL = CAGradientLayer()
  private let tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
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
  }

  private func setTableViewDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension TableVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section > 0 ? 3 : 4
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return TableViewCell()
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

