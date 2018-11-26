import UIKit

public enum ViewControllerNavigator {
    
    public static func moveRootViewController(completion: ((UIViewController?) -> Void)? = nil) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {return}
        move(rootViewController, completion: completion)
    }

    public static func move<T>(_ target: T, completion: ((UIViewController?) -> Void)? = nil) where T: UIViewController {
        moveProxy(nil, target, completion: completion)
    }
    
    public static func move<T>(_ target: T.Type, completion: ((UIViewController?) -> Void)? = nil) where T: UIViewController {
        moveProxy(target, nil, completion: completion)
    }
    
    public static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
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
    
    // MARK: - Private methods
    
    private static func moveProxy<T>(_ targetType: T.Type? = nil,
                                     _ targetInstance: T? = nil,
                                     completion: ((UIViewController?) -> Void)? = nil) where T: UIViewController {
        let topVC = topViewController()
        guard topVC?.compare(targetType, targetInstance) == false else {
            completion?(topVC)
            return
        }
        
        let parent = topVC?.parent
        if let navigationController = parent as? UINavigationController {
            guard navigationController.compare(targetType, targetInstance) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                moveProxy(targetType, targetInstance, completion: completion)
                return
            }
        } else if let tabBarController = parent as? UITabBarController, tabBarController.compare(targetType, targetInstance) {
            completion?(tabBarController)
            return
        } else if let pageViewController = parent as? UIPageViewController, pageViewController.compare(targetType, targetInstance) {
            completion?(pageViewController)
            return
        }
        
        if let navigationController = topVC?.navigationController {
            guard navigationController.compare(targetType, targetInstance) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                moveProxy(targetType, targetInstance, completion: completion)
                return
            }
        }
        
        if let tabBarController = topVC?.tabBarController, tabBarController.compare(targetType, targetInstance) {
            completion?(tabBarController)
            return
        }
        
        topVC?.dismiss(animated: false, completion: {
            moveProxy(targetType, targetInstance, completion: completion)
        })
    }
    
}

private extension UIViewController {
    
    func compare(_ targetType: UIViewController.Type? = nil, _ targetInstance: UIViewController? = nil) -> Bool {
        guard let targetType = targetType else {
            guard let targetInstance = targetInstance else {
                return false
            }
            
            return self == targetInstance
        }
        
        return self.isKind(of: targetType)
    }
    
}
