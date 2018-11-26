import UIKit

import ViewControllerNavigator

final class PushViewController: UIViewController {
    
    // MARK: - Properties
    
    private var moveRootButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("move RootViewController", for: .normal)
        return button
    }()
    private var pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("push PushViewController", for: .normal)
        return button
    }()
    private var modalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("present ModalViewController", for: .normal)
        return button
    }()
    
    // MARK: - Overridden: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        setSelector()
        view.addSubview(moveRootButton)
        view.addSubview(pushButton)
        view.addSubview(modalButton)
        layout()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        title = "PushViewController"
        view.backgroundColor = .white
    }
    
    private func setSelector() {
        moveRootButton.addTarget(self, action: #selector(moveRootButtonDidClicked), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonDidClicked), for: .touchUpInside)
        modalButton.addTarget(self, action: #selector(modalButtonDidClicked), for: .touchUpInside)
    }
    
    // MARK: - Private selector
    
    @objc private func moveRootButtonDidClicked() {
        ViewControllerNavigator.moveRootViewController()
    }
    
    @objc private func pushButtonDidClicked() {
        let pushViewController = PushViewController()
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @objc private func modalButtonDidClicked() {
        let modalViewController = ModalViewController()
        present(modalViewController, animated: true, completion: nil)
    }
    
}

// MARK: - Layout

extension PushViewController {
    
    private func layout() {
        moveRootButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 64).isActive = true
        moveRootButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        pushButton.topAnchor.constraint(equalTo: moveRootButton.bottomAnchor, constant: 32).isActive = true
        pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        modalButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 32).isActive = true
        modalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
    }
    
}
