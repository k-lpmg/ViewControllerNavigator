import UIKit

import ViewControllerNavigator

final class TabBarModalViewController: UIViewController {
    
    // MARK: - Properties
    
    private var moveRootButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("move RootViewController", for: .normal)
        return button
    }()
    private var moveTabBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("move TabBarController.self", for: .normal)
        return button
    }()
    private let modalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("present TabBarModalViewController", for: .normal)
        return button
    }()
    private let navigationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("present TabBarNavigationController", for: .normal)
        return button
    }()
    private let pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("push TabBarModalViewController", for: .normal)
        return button
    }()
    
    // MARK: - Overridden: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        setSelector()
        view.addSubview(moveRootButton)
        view.addSubview(moveTabBarButton)
        view.addSubview(modalButton)
        view.addSubview(navigationButton)
        if navigationController != nil {
            view.addSubview(pushButton)
        }
        layout()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
        
        let count = navigationController?.viewControllers.count ?? 1
        let titlePrefix = "TabBarModalViewController"
        title = count == 1 ? titlePrefix.appending(" - Root") :
            titlePrefix.appending(" - \(String(describing: navigationController?.viewControllers.count ?? 0))")
    }
    
    private func setSelector() {
        moveRootButton.addTarget(self, action: #selector(moveRootButtonDidClicked), for: .touchUpInside)
        moveTabBarButton.addTarget(self, action: #selector(moveTabBarButtonDidClicked), for: .touchUpInside)
        modalButton.addTarget(self, action: #selector(modalButtonDidClicked), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(navigationButtonDidClicked), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonDidClicked), for: .touchUpInside)
    }
    
    // MARK: - Private selector
    
    @objc private func moveRootButtonDidClicked() {
        ViewControllerNavigator.moveRootViewController()
    }
    
    @objc private func moveTabBarButtonDidClicked() {
        ViewControllerNavigator.move(TabBarController.self)
    }
    
    @objc private func modalButtonDidClicked() {
        let viewController = TabBarModalViewController()
        present(viewController, animated: true, completion: nil)
    }
    
    @objc private func navigationButtonDidClicked() {
        let rootViewController = TabBarModalViewController()
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func pushButtonDidClicked() {
        let viewController = TabBarModalViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - Layout

extension TabBarModalViewController {
    
    private func layout() {
        moveRootButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 64).isActive = true
        moveRootButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        moveTabBarButton.topAnchor.constraint(equalTo: moveRootButton.bottomAnchor, constant: 32).isActive = true
        moveTabBarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        modalButton.topAnchor.constraint(equalTo: moveTabBarButton.bottomAnchor, constant: 32).isActive = true
        modalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        navigationButton.topAnchor.constraint(equalTo: modalButton.bottomAnchor, constant: 32).isActive = true
        navigationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        if navigationController != nil {
            pushButton.topAnchor.constraint(equalTo: navigationButton.bottomAnchor, constant: 32).isActive = true
            pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        }
    }
    
}
