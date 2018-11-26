import UIKit

import ViewControllerNavigator

final class TabBarChildRootViewController: UIViewController {
    
    // MARK: - Properties
    
    var type: TabBarType!
    
    // MARK: - Properties
    
    private var moveRootButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("move RootViewController", for: .normal)
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
        button.setTitle("push TabBarChildViewController", for: .normal)
        return button
    }()
    
    // MARK: - Con(De)structor
    
    convenience init(type: TabBarType) {
        self.init()
        
        self.type = type
    }
    
    // MARK: - Overridden: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        setSelector()
        view.addSubview(moveRootButton)
        view.addSubview(modalButton)
        view.addSubview(navigationButton)
        view.addSubview(pushButton)
        layout()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
        title = type.rawValue
    }
    
    private func setSelector() {
        moveRootButton.addTarget(self, action: #selector(moveRootButtonDidClicked), for: .touchUpInside)
        modalButton.addTarget(self, action: #selector(modalButtonDidClicked), for: .touchUpInside)
        navigationButton.addTarget(self, action: #selector(navigationButtonDidClicked), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonDidClicked), for: .touchUpInside)
    }
    
    // MARK: - Private selector
    
    @objc private func moveRootButtonDidClicked() {
        ViewControllerNavigator.moveRootViewController()
    }
    
    @objc private func modalButtonDidClicked() {
        let modalViewController = TabBarModalViewController()
        present(modalViewController, animated: true, completion: nil)
    }
    
    @objc private func navigationButtonDidClicked() {
        let rootViewController = TabBarModalViewController()
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func pushButtonDidClicked() {
        let tabBarChildViewController = TabBarChildViewController(type: type)
        navigationController?.pushViewController(tabBarChildViewController, animated: true)
    }
    
}

// MARK: - Layout

extension TabBarChildRootViewController {
    
    private func layout() {
        moveRootButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 64).isActive = true
        moveRootButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        modalButton.topAnchor.constraint(equalTo: moveRootButton.bottomAnchor, constant: 32).isActive = true
        modalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        navigationButton.topAnchor.constraint(equalTo: modalButton.bottomAnchor, constant: 32).isActive = true
        navigationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        pushButton.topAnchor.constraint(equalTo: navigationButton.bottomAnchor, constant: 32).isActive = true
        pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
    }
    
}
