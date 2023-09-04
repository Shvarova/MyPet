//
//  AddPostViewController.swift
//  MyPet
//
//  Created by Дина Шварова on 09.06.2023.
//

import UIKit

protocol AddPostViewControllerDelegate {
    func setTitleFilter(title: String)
}

class AddPostViewController : UIViewController {
    
    private let mainView: AddPostView
    private var viewModel: AddPostViewModel?
    
    var scrollOffset : CGFloat = 0
    var distance : CGFloat = 0
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.contentInsetAdjustmentBehavior = .automatic
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    init(mainView: AddPostView) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addTapToHideKeyboard()
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.isUserInteractionEnabled = true
        scrollView.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        mainView.backgroundColor = .createColor(lightMode: .white, darkMode: .CustomColor.backgroundDark)
        mainView.openGalleryAction = openGallery
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func setViewModel (viewModel: AddPostViewModel) {
        self.viewModel = viewModel
        mainView.publishAction = viewModel.publish(image:title:description:)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 50
        scrollView.contentInset.bottom = contentInset.bottom
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: contentInset.bottom, right: 0)
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @objc func backButtonTouched() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func hideKeyboard() {
        mainView.endEditing(true)
    }
    
    private func addTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(tap)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(named: "Back button"), style: .plain, target: self, action: #selector(backButtonTouched))
        backButton.tintColor = .createColor(lightMode: .CustomColor.backgroundDark, darkMode: .white)
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func openGallery() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let topPaddind = (navigationController?.navigationBar.frame.height ?? .zero) + statusBarHeight
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            mainView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height - topPaddind)
        ])
    }
}

extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        mainView.setImage(image: image)
    }
}
