//
//  ActionViewController.swift
//  Extension
//
//  Created by Niclas Jeppsson on 22/12/2021.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

protocol ConverterOutput: AnyObject {

    func loadConverted(text: String)
    func errorOf(type: ConvertTextError)
}

class ActionViewController: UIViewController {

    private var convertJavaScript: Converter?

    private lazy var toggle: UIButton = {
        let toggle = UIButton()
        return toggle
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        convertJavaScript = ConvertJavaScript(converterOutput: self)
        setupNavBar()
        setViews()
        setupJavaScript()
    }

    private func setupNavBar() {

        title = "The Baking Converter"
        
        var navigationItem: UIBarButtonItem {
            let button = UIBarButtonItem(image: (UIImage(systemName: "arrow.backward.circle")), style: .plain , target: self, action: #selector(handleNavigation))
            button.tintColor = .black
            return button
        }

        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = navigationItem
    }
    
    private func setViews() {
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc private func handleNavigation() {
        self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
    }

    private func setupJavaScript() {
        guard let inputItem = extensionContext?.inputItems.first as? NSExtensionItem
        else { assertionFailure("Failed to type cast or no inputItem"); return }

        guard let itemProvider = inputItem.attachments?.first
        else { assertionFailure("no attachments"); return }

        itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) {
            [weak self] (dict, error) in

            guard let itemDictionary = dict as? NSDictionary else { print(error?.localizedDescription); return }
            guard let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary else { return }

            self?.convertJavaScript?.convert(text: javaScriptValues["selectedText"] as? String)

        }
    }
}

extension ActionViewController: ConverterOutput {

    func loadConverted(text: String) {
        DispatchQueue.main.async {
            self.textLabel.text = text
        }
    }

    func errorOf(type: ConvertTextError) {

        switch type {
        case .textIsNil:
            print("text is nil")
        }

    }
}
