//
//  MenuViewController.swift
//  TraceCovid19
//
//  Created by yosawa on 2020/04/09.
//

import UIKit

final class MenuViewController: UITableViewController, NavigationBarHiddenApplicapable {
    @IBOutlet weak var settingTableViewCell: UITableViewCell!
    @IBOutlet weak var aboutTableViewCell: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DebugTableViewCell")
    }

    private func gotoAbout() {
        navigationController?.pushViewController(AboutViewController.instantiate(), animated: true)
    }

    private func gotoSetting() {
        navigationController?.pushViewController(SettingViewController.instantiate(), animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch tableView.cellForRow(at: indexPath) {
        case aboutTableViewCell:
            gotoAbout()
        case settingTableViewCell:
            gotoSetting()
        default:
            break
        }
    }
}
