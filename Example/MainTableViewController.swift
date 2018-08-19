import UIKit

final class MainTableViewController: UITableViewController {
    
    // MARK: - Constants
    
    struct Const {
        static let cell = "cell"
    }
    
    // MARK: - Overridden: UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        title = "MainTableViewController"
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Const.cell)
    }
    
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cell, for: indexPath)
        var text = ""
        switch indexPath.row {
        case 0:
            text = "NavigationController"
        case 1:
            text = "ModalViewController"
        case 2:
            text = "TabBarController"
        case 3:
            text = "PageViewController"
        default:
            break
        }
        cell.textLabel?.text = text
        return cell
    }
    
}

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let pushViewcontroller = PushViewController()
            let subNavigationController = SubNavigationController(rootViewController: pushViewcontroller)
            present(subNavigationController, animated: true, completion: nil)
        case 1:
            let modalViewController = ModalViewController()
            present(modalViewController, animated: true, completion: nil)
        case 2:
            let tabBarController = TabBarController()
            present(tabBarController, animated: true, completion: nil)
        case 3:
            let pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
            present(pageViewController, animated: true, completion: nil)
        default:
            break
        }
    }
    
}
