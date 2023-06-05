//
//  ProfileViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 27.04.2023.
//

import UIKit

protocol ProfileOutput {
    func photosCellSelected()
}

class ProfileViewController : UIViewController {

    var output: ProfileOutput?
    
    private let mainView: ProfileView
    private var viewModel: ProfileViewModel?
    
    init(mainView: ProfileView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.backgroundColor = .CustomColor.backgroundDark
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setViewModel (viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        mainView.setPosts(posts: viewModel.posts)
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = PhotosViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
