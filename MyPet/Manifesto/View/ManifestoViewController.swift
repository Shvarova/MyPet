//
//  ManifestoViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 28.04.2023.
//

import UIKit

final class ManifestoViewController: UIViewController {
    
    private let mainView: ManifestoView
    private var viewModel: ManifestoViewModel?
    
    init(mainView: ManifestoView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
        mainView.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    func setViewModel (viewModel: ManifestoViewModel) {
        self.viewModel = viewModel
    }
    
    @objc func backButtonTouched() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(backButtonTouched))
        backButton.tintColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        navigationItem.leftBarButtonItem = backButton
    }
}


