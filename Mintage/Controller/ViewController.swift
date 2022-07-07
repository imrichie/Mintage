//
//  ViewController.swift
//  Mintage
//
//  Created by Richie Flores on 7/7/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var cryptoView: UIView!
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var rateLabel: UILabel!
  @IBOutlet weak var cryptoLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.cryptoView.layer.cornerRadius = 10
  }
}
