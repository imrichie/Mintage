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
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  var manager: CoinManager = CoinManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    manager.delegate = self
    cryptoView.layer.cornerRadius = 10
    manager.fetchPrices(for: "DOGE")
    
  }
}

extension ViewController: CoinManagerDelegate {
  func didUpdatePrice(_ manager: CoinManager, data: CoinData) {
    DispatchQueue.main.async {
      self.rateLabel.text = "\(data.rate)"
      self.cryptoLabel.text = "\(data.crypto)"
      self.image.image = UIImage(named: "\(data.crypto)")
    }
  }
  
  func didFailWithError(error: Error) {
    print("ERROR: \(error.localizedDescription)")
  }
  
  
}
