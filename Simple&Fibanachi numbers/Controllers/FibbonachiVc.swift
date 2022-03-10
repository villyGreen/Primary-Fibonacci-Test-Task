//
//  FibbonachiVc.swift
//  Simple&Fibanachi numbers
//
//  Created by zz on 10.03.2022.
//  Copyright © 2022 Vadim Vitkovskiy. All rights reserved.
//

import UIKit

class FibonacciVc: UITableViewController {

    var evenNumbers = [Double?]()
    var oddNumbers = [Double?]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            GenerateService.shared.fib { (value, index) in
                if index%2 == 0 {
                    self.oddNumbers.append(value)
                } else {
                    self.evenNumbers.append(value)
                }
                if index%10 == 0 {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        tableView.separatorStyle = .none
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Fibonacci"
        loadData()
    }
}

extension FibonacciVc {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evenNumbers.count - 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id, for: indexPath) as! CustomTableViewCell
        if indexPath.row%2 == 0 {
            setCell(cell: cell, bcOne: .gray, bcTwo: .white, tcOne: .white, tcTwo: .black)
        } else {
            setCell(cell: cell, bcOne: .white, bcTwo: .gray, tcOne: .black, tcTwo: .white)
        }

        if indexPath.row < evenNumbers.count - 1 {
            cell.firstLabel.text = "\(evenNumbers[indexPath.row]!)"
            cell.secondLabel.text = "\(oddNumbers[indexPath.row]!)"
        }
        return cell
    }
    private func setCell(cell: CustomTableViewCell, bcOne: UIColor, bcTwo: UIColor, tcOne: UIColor, tcTwo: UIColor) {
        cell.firstLabel.backgroundColor = bcOne
        cell.firstLabel.textColor = tcOne
        cell.secondLabel.backgroundColor = bcTwo
        cell.secondLabel.textColor = tcTwo
    }
}
