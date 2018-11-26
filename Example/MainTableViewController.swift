import UIKit

enum MainTableItem: String, CaseIterable {
    case modally = "Modally"
    case navigating = "Navigating"
    case page = "Page"
    case tabbar = "TabBar"
}

final class MainTableViewController: UITableViewController {
    
    // MARK: - Constants
    
    struct Const {
        static let cell = "cell"
    }
    
    // MARK: - Properties
    
    var items = MainTableItem.allCases
    
    // MARK: - Overridden: UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        title = "ViewControllerNavigator"
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Const.cell)
    }
    
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cell, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].rawValue
        return cell
    }
    
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch items[indexPath.row] {
        case .modally:
            let modalViewController = ModalViewController()
            present(modalViewController, animated: true, completion: nil)
        case .navigating:
            let pushViewcontroller = PushViewController()
            let subNavigationController = SubNavigationController(rootViewController: pushViewcontroller)
            present(subNavigationController, animated: true, completion: nil)
        case .page:
            let pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
            present(pageViewController, animated: true, completion: nil)
        case .tabbar:
            let tabBarController = TabBarController()
            present(tabBarController, animated: true, completion: nil)
        }
    }
    
}
