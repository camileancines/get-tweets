//
//  TweetsViewController.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 16/11/21.
//

import UIKit

final class TweetsTableViewController: UITableViewController {
    
    fileprivate let viewModel: TweetsViewModel
    var tweetsText: String?
    
    init(username: String) {
        self.viewModel = .init(username: username)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
    }
}


extension TweetsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tweets"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tweets = viewModel.getTweetsText()
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as! TweetTableViewCell
        
        for tweetsVM in viewModel.getTweetsText() {
            cell.setComponentView(tweetText: tweetsVM.text)
        }
        
        return cell
    }
    
//    func setupTweets() -> String {
//        for tweetsVM in viewModel.getTweetsText() {
//            return tweetsVM.text
//        }
//    }
}
