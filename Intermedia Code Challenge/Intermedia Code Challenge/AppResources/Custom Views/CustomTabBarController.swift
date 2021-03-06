//
//  CustomTabBarController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setView() 
        generateViewControllers()
    }

    private func setView() {
        modalPresentationStyle = .fullScreen
        setColor()
        setFont()
    }

    private func setColor() {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        UIColor.customWhiteColor.setFill()
        UIRectFill(rect)

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
        }
    }

    private func setFont() {
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: Fonts.robotoRegular, size: 12)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }

    private func generateViewControllers() {

        guard let selectedHeroIcon = UIImage(named: AssetConstants.heroIconEnabled),
              let selectedCalendarIcon = UIImage(named: AssetConstants.calendarIconEnabled),
              let disabledHeroIcon = UIImage(named: AssetConstants.heroIconDisabled),
              let disabledCalendarIcon = UIImage(named: AssetConstants.calendarIconDisabled) else { return }

        let heroNavigationController =  generateNavigationController(HeroViewController(with: HeroPresenter(service: HeroService(repository: HeroRepository(url: NetworkingConstants.baseURL)))),
                                                                     title: TitleConstants.firstTabBarTitle,
                                                                     selectedImage: selectedHeroIcon,
                                                                     disabledImage: disabledHeroIcon)
        let eventsNavigationController = generateNavigationController(EventsViewController(with: EventsPresenter(service: StoriesService(repository: EventsRepository(url: NetworkingConstants.baseURL)))),
                                                                      title: TitleConstants.secondTabBarTitle,
                                                                      selectedImage: selectedCalendarIcon,
                                                                      disabledImage: disabledCalendarIcon)

        viewControllers = [heroNavigationController, eventsNavigationController]
    }

    private func generateNavigationController(_ viewController: BaseViewController, title: String, selectedImage: UIImage, disabledImage: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = title
        navigationController.tabBarItem.image = disabledImage.withRenderingMode(.alwaysOriginal)
        navigationController.tabBarItem.selectedImage = selectedImage.withRenderingMode(.alwaysOriginal)
        return navigationController
    }
}
