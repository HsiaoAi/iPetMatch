//
//  AudioCaliingViewController.swift
//  iPetMatch
//
//  Created by Hsiao Ai LEE on 15/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class MakeAudioCallViewController: UIViewController {

    @IBOutlet weak var declineButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.navigationBar.topItem?.title =  "撥打語音電話中"

        QBRTCClient.instance().add(self)

        declineButton.addTarget(self, action: #selector(declineCall), for: .touchUpInside)

        self.navigationItem.title = "撥打語音電話中"

    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

    }

}

extension MakeAudioCallViewController: QBRTCClientDelegate {

    func session(_ session: QBRTCSession, acceptedByUser userID: NSNumber, userInfo: [String: String]? = nil) {

        self.navigationItem.title =  "通話中"

    }

    func session(_ session: QBRTCSession, rejectedByUser userID: NSNumber, userInfo: [String: String]? = nil) {

        self.navigationItem.title =  "被拒絕"

    }

    func session(_ session: QBRTCSession, hungUpByUser userID: NSNumber, userInfo: [String: String]? = nil) {

        self.navigationItem.title =  "被掛斷"

    }

    func sessionDidClose(_ session: QBRTCSession) {

        self.navigationItem.title = ""

        self.navigationController?.popToRootViewController(animated: true)

    }

}

// Button funtions

extension MakeAudioCallViewController {

    @objc func declineCall() {

        let userInfo: [String: String] = ["key": "value"]

        CallManager.shared.session?.hangUp(userInfo)

        CallManager.shared.session = nil

    }

}
