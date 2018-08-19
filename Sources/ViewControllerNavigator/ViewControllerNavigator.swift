import UIKit

open class ViewControllerNavigator {
    
    public static let shared = ViewControllerNavigator()
    
    // MARK: - Public methods
    
    public func moveRootViewController(completion: ((UIViewController?) -> Void)? = nil) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {return}
        move(viewController: rootViewController, completion: completion)
    }
    
    public func move(viewController target: UIViewController, completion: ((UIViewController?) -> Void)? = nil) {
        let topVC = topViewController()
        guard topVC != target else {
            completion?(topVC)
            return
        }
        
        let parent = topVC?.parent
        if let navigationController = parent as? UINavigationController {
            guard navigationController != target else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(viewController: target, completion: completion)
                return
            }
            
            guard navigationController.presentingViewController != nil else {
                completion?(topVC)
                return
            }
            
            parent?.dismiss(animated: false, completion: {
                self.move(viewController: target, completion: completion)
            })
        } else if let tabBarController = parent as? UITabBarController, tabBarController == target {
            completion?(tabBarController)
            return
        } else if let pageViewController = parent as? UIPageViewController, pageViewController == target {
            completion?(pageViewController)
            return
        }
        
        topVC?.dismiss(animated: false, completion: {
            self.move(viewController: target, completion: completion)
        })
    }
    
    public func move(class target: AnyClass, completion: ((UIViewController?) -> Void)? = nil) {
        let topVC = topViewController()
        guard topVC?.isKind(of: target) == false else {
            completion?(topVC)
            return
        }
        
        let parent = topVC?.parent
        if let navigationController = parent as? UINavigationController {
            guard navigationController.isKind(of: target) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(class: target, completion: completion)
                return
            }
            
            guard navigationController.presentingViewController != nil else {
                completion?(topVC)
                return
            }
            
            parent?.dismiss(animated: false, completion: {
                self.move(class: target, completion: completion)
            })
        } else if let tabBarController = parent as? UITabBarController, tabBarController.isKind(of: target) {
            completion?(tabBarController)
            return
        } else if let pageViewController = parent as? UIPageViewController, pageViewController.isKind(of: target) {
            completion?(pageViewController)
            return
        }
        
        topVC?.dismiss(animated: false, completion: {
            self.move(class: target, completion: completion)
        })
    }
    
    public func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController, let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
}
