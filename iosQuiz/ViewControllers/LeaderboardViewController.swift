//
//  LeaderboardViewController.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {

    @IBOutlet weak var scoreTable: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    
    var viewModel: LeaderboardViewModel!
    var refreshControl: UIRefreshControl!
    
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    convenience init(viewModel: LeaderboardViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    @IBAction func onTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupTableView() {
        let nib = UINib.init(nibName: "ScoreTableViewCell", bundle: nil)
        scoreTable.register(nib, forCellReuseIdentifier: "ScoreTableViewCell")
        
        scoreTable.delegate = self
        scoreTable.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(LeaderboardViewController.refresh), for: .valueChanged)
        
        scoreTable.allowsSelection = false
        scoreTable.backgroundView = activityIndicator
    }
    
    func bindViewModel() {
        activityIndicator.startAnimating()
        scoreTable.separatorStyle = .none
        viewModel.fetchQuizScores { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.scoreTable.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.scoreTable.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
}

extension LeaderboardViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scoreTable.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath) as! ScoreTableViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.white : UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.5)
        if let scoreCellData = viewModel.scoreCellData(atIndexPath: indexPath) {
            cell.populate(with: scoreCellData)
        }
        return cell
    }
    
}
