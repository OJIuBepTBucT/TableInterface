//
//  TableViewCell.swift
//  tableInterface
//
//  Created by User on 30.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

  var icon = UIImageView()
  var titleLable = UILabel()
  var texLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(icon)
    addSubview(titleLable)
    addSubview(texLabel)

    configureIcon()
    configureText()
    configureTitle()
    setIcon()
    setTitle()
    setTex()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureIcon() {
    icon.layer.cornerRadius = 10
    icon.clipsToBounds = true
    icon.image = UIImage(named: "image0")
  }

  func configureTitle() {
    titleLable.numberOfLines = 0
    titleLable.adjustsFontSizeToFitWidth = true
    titleLable.text = "hello"
  }

  func configureText() {
    texLabel.numberOfLines = 0
    texLabel.adjustsFontSizeToFitWidth = true
    texLabel.text = "hellouuu"
  }

  func setIcon() {
    icon.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      icon.centerYAnchor.constraint(equalTo: centerYAnchor),
      icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      icon.heightAnchor.constraint(equalToConstant: 60),
      icon.widthAnchor.constraint(equalTo: heightAnchor)
      ])
  }

  func setTitle() {
    titleLable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLable.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
      titleLable.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 150),
      titleLable.heightAnchor.constraint(equalToConstant: 30),
      titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }

  func setTex() {
    texLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      texLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
      texLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor, constant: 150),
      texLabel.heightAnchor.constraint(equalToConstant: 20),
      texLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }
}
