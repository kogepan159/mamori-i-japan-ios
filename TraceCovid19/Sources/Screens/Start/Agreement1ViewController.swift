//
//  Agreement1ViewController.swift
//  TraceCovid19
//
//  Created by yosawa on 2020/04/11.
//

import UIKit
import NVActivityIndicatorView

final class Agreement1ViewController: UIViewController, NavigationBarHiddenApplicapable, InputPrefectureAccessable {
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.layer.cornerRadius = 8.0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        scrollView.flashScrollIndicators()
    }

    @IBAction func tappedReadAllAgreementButton(_ sender: Any) {
        // TODO: URL
        showAlert(message: "URLを設定して必要な情報に誘導します")
    }

    @IBAction func tappedNextButton(_ sender: Any) {
        pushToInputPrefecture(flow: .start)
    }
}
