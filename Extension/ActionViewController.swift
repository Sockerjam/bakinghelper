//
//  ActionViewController.swift
//  Extension
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ActionViewController: UIViewController {
    
    private lazy var highlightedText: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setup()
    }
    
    private func setViews() {
        view.addSubview(highlightedText)
        
        NSLayoutConstraint.activate([
            highlightedText.topAnchor.constraint(equalTo: view.topAnchor),
            highlightedText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            highlightedText.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            highlightedText.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setup() {
        guard let inputItem = extensionContext?.inputItems.first as? NSExtensionItem
        else { assertionFailure("Failed to type cast or no inputItem"); return }
        
        guard let itemProvider = inputItem.attachments?.first
        else { assertionFailure("no attachments"); return }
        
        itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) {
            [weak self] (dict, error) in
            
            guard let itemDictionary = dict as? NSDictionary else { print(error?.localizedDescription); return }
            guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }
            
            DispatchQueue.main.async {
                self?.highlightedText.text = javaScriptValues["selectedText"] as? String
            }
        }
    }

}
