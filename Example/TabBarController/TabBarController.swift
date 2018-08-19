import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Overridden: UITabBarController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        view.backgroundColor = .white
        let viewControllers = [TabBarChildViewController(title: "Child1"), TabBarChildViewController(title: "Child2"), TabBarChildViewController(title: "Child3"), TabBarChildViewController(title: "Child4")]
        self.viewControllers = viewControllers
        if let items = tabBar.items {
            items[0].title = "1"
            items[1].title = "2"
            items[2].title = "3"
            items[3].title = "4"
        }
    }
    
}
