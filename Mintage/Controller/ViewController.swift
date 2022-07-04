//
//  ViewController.swift
//  Mintage
//
//  Created by Richie Flores on 3/29/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var rectView: UIView!
  
  let coinManager = CoinManager()
  var countries: [String] = ["USA", "Mexico", "Canada", "Columbia", "Cuba", "Japan", "Russia", "Spain"]
  override func viewDidLoad() {
    super.viewDidLoad()
    self.rectView.layer.cornerRadius = 8
    //coinManager.getPrices(in: "USD")
  }
}

// MARK: - Extensions
extension ViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    if let userInput = searchBar.text {
      countries.append(userInput)
    }
    searchBar.text = ""
    tableView.reloadData()
  }
  
  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  // Datasource method
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }
  
  // Delegate methods
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
    cell.textLabel!.text = countries[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Countries"
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
