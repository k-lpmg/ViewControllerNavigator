import UIKit

import ViewControllerNavigator

final class ModalViewController: UIViewController {
    
    // MARK: - Properties
    
    private var moveRootButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("move rootViewController", for: .normal)
        return button
    }()
    private let modalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("modal", for: .normal)
        return button
    }()
    private let navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("navigation", for: .normal)
        return button
    }()
    
    // MARK: - Overridden: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        setSelector()
        view.addSubview(moveRootButton)
        view.addSubview(modalButton)
        view.addSubview(navigationButton)
        layout()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
    }
    
    private func setSelector() {
        moveRootButton.addTarget(self, action: #selector(moveRootButtonDidClicked), for: .touchUpInside)
        modalButton.addTarget(self, action: #selector(modalButtonDidClicked), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(navigationButtonDidClicked), for: .touchUpInside)
    }
    
    // MARK: - Private selector
    
    @objc private func moveRootButtonDidClicked() {
        ViewControllerNavigator.moveRootViewController()
    }
    
    @objc private func modalButtonDidClicked() {
        let modalViewController = ModalViewController()
        present(modalViewController, animated: true, completion: nil)
    }
    
    @objc private func navigationButtonDidClicked() {
        let pushViewController = PushViewController()
        let navigationController = UINavigationController(rootViewController: pushViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
}

extension ModalViewController {
    
    private func layout() {
        moveRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moveRootButton.bottomAnchor.constraint(equalTo: modalButton.topAnchor, constant: -32).isActive = true
        
        modalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modalButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigationButton.topAnchor.constraint(equalTo: modalButton.bottomAnchor, constant: 32).isActive = true
    }
    
}
