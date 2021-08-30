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
      icon.leadingAnchor.constraint(equalTo: icon.leadingAnchor),
      icon.heightAnchor.constraint(equalToConstant: 80),
      icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
      ])
  }
  
  func setTitle() {
    titleLable.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLable.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleLable.leadingAnchor.constraint(equalTo: icon.leadingAnchor),
      titleLable.heightAnchor.constraint(equalToConstant: 50),
      titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }
  
  func setTex() {
    texLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      texLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 3),
      texLabel.leadingAnchor.constraint(equalTo: icon.leadingAnchor),
      texLabel.heightAnchor.constraint(equalToConstant: 30),
      texLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
      ])
  }
}
