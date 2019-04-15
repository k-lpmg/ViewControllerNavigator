import UIKit

final class PageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [PageChildViewController(title: "Child1"), PageChildViewController(title: "Child2"), PageChildViewController(title: "Child3"), PageChildViewController(title: "Child4")]
    }()
    
    // MARK: - Overridden: UIPageViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        dataSource = self
        setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true, completion: nil)
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        guard orderedViewControllers.count > previousIndex else {return nil}
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {return nil}
        guard orderedViewControllersCount > nextIndex else {return nil}
        
        return orderedViewControllers[nextIndex]
    }
    
}
