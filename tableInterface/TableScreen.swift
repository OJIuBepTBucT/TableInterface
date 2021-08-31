import Foundation
import UIKit

class TableScreen: UIViewController {
  let gradientL = CAGradientLayer()
  let tableView = UITableView()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGradient()
    configureTableView()
  }

  func setupGradient() {
    gradientL.frame = self.view.bounds
    gradientL.colors = [UIColor.systemTeal.cgColor, UIColor.systemTeal.cgColor, UIColor.white.cgColor]
    gradientL.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientL.endPoint = CGPoint (x: 1.0, y: 1.0)
    self.view.layer.insertSublayer(gradientL, at: 0)
  }

  func configureTableView() {
    view.addSubview(tableView)
    setTableViewDelegate()
    tableView.rowHeight = 80
    tableView.anchorTable(to: view)
    tableView.layer.cornerRadius = 15
    tableView.layer.masksToBounds = true
  }

  func setTableViewDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }

}

extension TableScreen: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var sect = section
    if sect > 0 {
      return 3
    } else {
      return 4
    }
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

