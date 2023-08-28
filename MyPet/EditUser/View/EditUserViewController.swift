//
//  EditUserViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 18.07.2023.
//

import UIKit

class EditUserViewController : UIViewController {
    
    private let mainView: EditUserView
    private var viewModel: EditUserViewModel?
    
    init(mainView: EditUserView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
        mainView.backgroundColor = .CustomColor.backgroundDark
        mainView.openGalleryAction = openGallery
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addTapToHideKeyboard()
    }
    
    func setViewModel (viewModel: EditUserViewModel) {
        self.viewModel = viewModel
        mainView.saveAction = viewModel.save
    }
    
    @objc func backButtonTouched() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(backButtonTouched))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func openGallery() {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    
    private func addTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        mainView.endEditing(true)
    }
}

extension EditUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        mainView.setImage(image: image)
    }
}

