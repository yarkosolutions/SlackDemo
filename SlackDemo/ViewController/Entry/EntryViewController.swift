//
//  EntryViewController.swift
//  SlackDemo
//
//  Created by Yarko on 3/19/25.
//

import UIKit

class EntryViewController: UIViewController {
    
    private lazy var joinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .mainGreenColor
        button.setTitle("Join", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUIView()
        setupAction()
    }
    
    //MARK: - set up ui view (add subviews into self.view)
    private func setupUIView() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(joinButton)
        joinButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        joinButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        joinButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    //MARK: - set up ui action (tap gesture, delegate, data source)
    private func setupAction() {
        joinButton.addTarget(self, action: #selector(didTapJoinButton), for: .touchUpInside)
    }
    
    @objc func didTapJoinButton(sender: UIButton) {
        let mainVC = MainViewController()
        mainVC.setDependencies(vm: MainViewModel())
        self.navigationController?.pushViewController(mainVC, animated: true)
    }

}

