//
//  TabBarController.swift
//  iPetMatch
//
//  Created by Hsiao Ai LEE on 15/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

class TabBarController: UITabBarController {

    // MARK: Init

    init(itemTypes: [TabBarItemType]) {

        super.init(nibName: nil, bundle: nil)

        let viewControllers: [UIViewController] = itemTypes.map(TabBarController.prepare)

        setViewControllers(viewControllers, animated: false)

    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

    }

    // MARK: View Life Cycle

    override func viewDidLoad() {

        super.viewDidLoad()

        setUpTabBar()

        QBRTCClient.instance().add(self)

        QBRTCAudioSession.instance().initialize()

    }

    // MARK: Set up tab bar

    func setUpTabBar() {

        // Delegate

        tabBar.barStyle = .default

        tabBar.isTranslucent = false

        tabBar.tintColor = UIColor.lightGray

    }

    static func prepare(for itemType: TabBarItemType) -> UIViewController {

        switch itemType {

        case .chat:

            let chatListTableViewController = ChatListTableViewController()

            let navigationController = UINavigationController(rootViewController: chatListTableViewController)

            navigationController.tabBarItem = TabBarItem(itemType: itemType)

            return navigationController

        }

    }

}