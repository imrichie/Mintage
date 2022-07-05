//
//  ViewController.swift
//  Mintage
//
//  Created by Richie Flores on 3/29/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  let coinManager = CoinManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //coinManager.getPrices(in: "USD")
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  // Datasource method
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return coinManager.currencyArray.count
  }
  
  // Delegate methods
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath)
    tableView.rowHeight = 90
    print("Row Height for \(indexPath.row) row = \(tableView.rowHeight)")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
