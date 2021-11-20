//
//  TweetsMainViewController.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation
import UIKit

final class TweetsMainViewController: UIViewController {
    
    //MARK: - Properties
    fileprivate let viewModel: TweetsViewModel = TweetsViewModel()
    
    //MARK: View's Components
    lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        view.addSubview(scrollV)
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollV.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollV.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return scrollV
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        return stack
    }()
    
    lazy var headerSearchView: SearchUsernameView = {
       let searchView = SearchUsernameView()
        searchView.delegate?.searchUsernameButtonAction(username: searchView.usernameTextView.text)
        searchView.layer.cornerRadius = 14
        searchView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(searchView)
        searchView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        searchView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        searchView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 5).isActive = true
        return searchView
    }()
    
    lazy var tweetsView: [TweetComponentView] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func fetchTweets() {
        viewModel.fetchTweets {
            [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success():
                self.setupTweets()
            
            case .failure():
                self.showAlertView()
            }
        }
    }
    
    func setupTweets() {
        for tweetsVM in viewModel.getTweetsText(userId: "") {
            let tweet = TweetComponentView()
            tweet.tweetText = tweetsVM.text
            tweet.translatesAutoresizingMaskIntoConstraints = false
            tweetsView.append(tweet)
        }
    }
    
    //MARK: - View Setup
    func setupUI() {
        view.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
        stackView.topAnchor.constraint(equalTo: headerSearchView.bottomAnchor, constant: 8).isActive = true
        
        let bottom = stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        bottom.priority = UILayoutPriority(250)
        bottom.isActive = true
        
        for tweetView in tweetsView {
            stackView.addArrangedSubview(tweetView)
        }
    }
}

//MARK: - AlertView's Method
extension TweetsMainViewController {
    func showAlertView() {
        let alert = UIAlertController(title: "Ops!", message: "Não foi possível carregar os tuítes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { action in
            self.fetchTweets()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
