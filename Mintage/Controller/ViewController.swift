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
    manager.fetchPrices(for: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!)
    cryptoView.layer.cornerRadius = 10    
  }
  
  func formatRate(number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: number)) ?? "$0.00"
  }
  
  @IBAction func indexChanged(_ sender: UISegmentedControl) {
    switch segmentedControl.selectedSegmentIndex {
      case 0:
        manager.fetchPrices(for: sender.titleForSegment(at: 0)!)
      case 1:
        manager.fetchPrices(for: sender.titleForSegment(at: 1)!)
      case 2:
        manager.fetchPrices(for: sender.titleForSegment(at: 2)!)
      default:
        break;
    }
  }
}

extension ViewController: CoinManagerDelegate {
  func didUpdatePrice(_ manager: CoinManager, data: CoinData) {
    let formattedRate = formatRate(number: data.rate)
    DispatchQueue.main.async {
      self.rateLabel.text = formattedRate
      self.cryptoLabel.text = "\(data.crypto)"
      self.image.image = UIImage(named: "\(data.crypto)")
    }
  }
  
  func didFailWithError(error: Error) {
    print("ERROR: \(error.localizedDescription)")
  }
}
