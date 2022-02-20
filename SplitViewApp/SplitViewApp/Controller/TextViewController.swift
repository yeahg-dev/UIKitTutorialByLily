//
//  TextViewController.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/16.
//

import UIKit

protocol TextViewControllerDelegate: AnyObject {
    func textViewController(_ viewController: TextViewController, didChangeTextView string: String?)
}

class TextViewController: UIViewController {
    weak var delegate: TextViewControllerDelegate?
    
    private var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        // TODO: UITraitCollection에 따라 font 설정하는 코드 추가
        textView.font = .preferredFont(forTextStyle: .body)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func loadView() {
        view = .init()
        view.backgroundColor = .white
        view.addSubview(textView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextViewLayout()
        setUpNavigationItems()
        textView.delegate = self
    }
    
    private func setUpNavigationItems() {
        let circleImage = UIImage(systemName: "ellipsis.circle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: circleImage,
            style: .plain,
            target: self,
            action: #selector(tappedCircleButton(sender:))
        )
    }
    
    private func setUpTextViewLayout() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func updateTextViewContent(with string: String?) {
        textView.text = string
    }
    
    @objc
    private func tappedCircleButton(sender: AnyObject) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let shareAction = UIAlertAction(title: "Share", style: .default) { (action: UIAlertAction) in
            self.presentActivityView(action: action)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        
        alertController.addAction(shareAction)
        alertController.addAction(deleteAction)
        
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = sender as? UIBarButtonItem
          }
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc
    private func presentActivityView(action: UIAlertAction) {
        let text = textView.text
        let activityController = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )
        
        if let popoverController = activityController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(
                x: self.view.bounds.midX,
                y: self.view.bounds.midY,
                width: 0,
                height: 0
            )
        }
        present(activityController, animated: true, completion: nil)
    }

}

extension TextViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let description = textView.text
        delegate?.textViewController(self, didChangeTextView: description)
    }
}
