import UIKit

public enum ViewControllerNavigator {
    
    public static func moveRootViewController(completion: ((UIViewController?) -> Void)? = nil) {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {return}
        move(rootViewController, completion: completion)
    }
    
    public static func move(_ target: UIViewController, completion: ((UIViewController?) -> Void)? = nil) {
        let topVC = topViewController()
        guard topVC?.isEqualViewController(target) == false else {
            completion?(topVC)
            return
        }
        
        let parent = topVC?.parent
        if let navigationController = parent as? UINavigationController {
            guard navigationController.isEqualViewController(target) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(target, completion: completion)
                return
            }
        } else if let tabBarController = parent as? UITabBarController, tabBarController.isEqualViewController(target) {
            completion?(tabBarController)
            return
        } else if let pageViewController = parent as? UIPageViewController, pageViewController.isEqualViewController(target) {
            completion?(pageViewController)
            return
        }
        
        if let navigationController = topVC?.navigationController {
            guard navigationController.isEqualViewController(target) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(target, completion: completion)
                return
            }
        }
        
        if let tabBarController = topVC?.tabBarController, tabBarController.isEqualViewController(target) {
            completion?(tabBarController)
            return
        }
        
        topVC?.dismiss(animated: false, completion: {
            self.move(target, completion: completion)
        })
    }
    
    public static func move(_ target: AnyClass, completion: ((UIViewController?) -> Void)? = nil) {
        let topVC = topViewController()
        guard topVC?.isEqualViewController(target) == false else {
            completion?(topVC)
            return
        }
        
        let parent = topVC?.parent
        if let navigationController = parent as? UINavigationController {
            guard navigationController.isEqualViewController(target) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(target, completion: completion)
                return
            }
        } else if let tabBarController = parent as? UITabBarController, tabBarController.isEqualViewController(target) {
            completion?(tabBarController)
            return
        } else if let pageViewController = parent as? UIPageViewController, pageViewController.isEqualViewController(target) {
            completion?(pageViewController)
            return
        }
        
        if let navigationController = topVC?.navigationController {
            guard navigationController.isEqualViewController(target) == false else {
                completion?(navigationController)
                return
            }
            
            guard navigationController.isRootViewControllerShown else {
                navigationController.popViewController(animated: false)
                move(target, completion: completion)
                return
            }
        }
        
        if let tabBarController = topVC?.tabBarController, tabBarController.isEqualViewController(target) {
            completion?(tabBarController)
            return
        }
        
        topVC?.dismiss(animated: false, completion: {
            self.move(target, completion: completion)
        })
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
    
}

private extension UIViewController {
    
    func isEqualViewController(_ target: UIViewController) -> Bool {
        return self == target
    }
    
    func isEqualViewController(_ target: AnyClass) -> Bool {
        return self.isKind(of: target)
    }
    
}
