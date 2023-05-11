//
//  LikedView.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit
import CoreData

final class LikedView: UIView {
//    private var posts: [PostEntity] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView ()
//        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setPosts(posts: [PostEntity]) {
//        self.posts = posts
//        tableView.reloadData()
//    }
    
    private func setupView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


//extension LikedView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        posts.count
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) }
//        let row = indexPath.row
//        cell.selectionStyle = .none
//        cell.authorLabel.text = posts[row].author
//        cell.setupImage(name: posts[row].image ?? "")
//        cell.descriptionLabel.text = posts[row].descript
//        cell.likesLabel.text = "Likes: \(posts[row].likes)"
//        cell.viewsLabel.text = "Views: \(posts[row].views)"
//        return cell
//    }
//}

