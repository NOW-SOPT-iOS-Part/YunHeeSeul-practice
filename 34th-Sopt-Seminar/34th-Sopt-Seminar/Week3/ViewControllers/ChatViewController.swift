//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

class ChatViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain) // -- 2번
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        register()
    }
    
    private func setLayout() { // -- 3번
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
    
    private func setDelegate() {
            tableView.delegate = self
            tableView.dataSource = self
        }

}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(
                  withIdentifier: ChatTableViewCell.identifier,
                  for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        return cell
    } 
}
