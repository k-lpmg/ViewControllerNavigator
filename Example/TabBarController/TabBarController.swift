import UIKit

enum TabBarType: String {
    case tab1 = "Tab1"
    case tab2 = "Tab2"
    case tab3 = "Tab3"
    case tab4 = "Tab4"
}

final class TabBarController: UITabBarController {

    // MARK: - UI Components
    
    let childRootVC1 = TabBarChildRootViewController(type: .tab1)
    let childRootVC2 = TabBarChildRootViewController(type: .tab2)
    let childRootVC3 = TabBarChildRootViewController(type: .tab3)
    let childRootVC4 = TabBarChildRootViewController(type: .tab4)
    
    lazy var childNavigation1: TabBarNavigationController = {
        let rootViewController = self.childRootVC1
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: rootViewController.type.rawValue, image: nil, tag: 0)
        return navigationController
    }()
    lazy var childNavigation2: TabBarNavigationController = {
        let rootViewController = self.childRootVC2
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: rootViewController.type.rawValue, image: nil, tag: 1)
        return navigationController
    }()
    lazy var childNavigation3: TabBarNavigationController = {
        let rootViewController = self.childRootVC3
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: rootViewController.type.rawValue, image: nil, tag: 2)
        return navigationController
    }()
    lazy var childNavigation4: TabBarNavigationController = {
        let rootViewController = self.childRootVC4
        let navigationController = TabBarNavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: rootViewController.type.rawValue, image: nil, tag: 3)
        return navigationController
    }()
    
    // MARK: - Overridden: UITabBarController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
        viewControllers = [childNavigation1, childNavigation2, childNavigation3, childNavigation4]
    }
    
}
