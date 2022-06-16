//
//  ViewController.swift
//  Mintage
//
//  Created by Richie Flores on 3/29/22.
//

import UIKit

class ViewController: UIViewController {
  let coinManager = CoinManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    coinManager.getPrices(in: "USD Coin")
  }
}
