//
//  ResultsViewController.swift
//  Millionaire
//
//  Created by Никита Троян on 29.12.2021.
//

import UIKit

final class ResultsViewController: UIViewController {
    
    let dateForemater: DateFormatter = {
        var dateForemater = DateFormatter()
        dateForemater.dateStyle = .long
        return dateForemater
    }()
    
    
    @IBAction func backHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ResultsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        let record = Game.shared.games[indexPath.row]
        cell.textLabel?.text = "\(record.finalScore())"
        cell.detailTextLabel?.text = self.dateForemater.string(from: record.date)
        return cell
    }
}

