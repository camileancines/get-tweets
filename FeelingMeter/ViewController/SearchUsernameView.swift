//
//  SearchUsernameView.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 19/11/21.
//

import UIKit

protocol SearchUsernameDelegate: AnyObject {
    func searchUsernameButtonAction(username: String)
}

@IBDesignable
final class SearchUsernameView: UIView {
    
    //MARK: - Properties
    public weak var delegate: SearchUsernameDelegate?
    
    //MARK: - View's Components
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var usernameTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16.0)
        textView.textAlignment = .left
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var searchUserButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTouchSearchUsernameButtonAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setContentView()
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setContentView()
        setupUI()
    }
    
    //MARK: - View Setup
    private func setContentView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(usernameTextView)
        stackView.addArrangedSubview(searchUserButton)
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            usernameTextView.heightAnchor.constraint(equalToConstant: 35),
            usernameTextView.widthAnchor.constraint(equalToConstant: 135)
            ])
    }
    
    //MARK: - Button Action
    @objc
    private func didTouchSearchUsernameButtonAction() {
        delegate?.searchUsernameButtonAction(username: usernameTextView.text)
    }
}
