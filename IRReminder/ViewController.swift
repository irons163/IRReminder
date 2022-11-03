//
//  ViewController.swift
//  IRReminder
//
//  Created by Phil Chang on 2022/7/30.
//  Copyright © 2022 Yahoo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    @IBOutlet var progressContainerView: UIView!
    @IBOutlet var percentCompleteView: UIView!
    @IBOutlet var percentIncompleteView: UIView!
    @IBOutlet var percentCompleteHeightConstraint: NSLayoutConstraint!

    enum Constraints {
        static let showDetailSegueIdentifier = ""
        static let mainStoryboardName = "Main"
        static let detailViewControllerIdentifier = "ReminderDetailViewController"
    }

    private var reminderListDataSource: ReminderListDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reminderListDataSource = ReminderListDataSource(reminderCompletedAction: { reminderIndex in
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [IndexPath(row: reminderIndex, section: 0)], with: .automatic)
                self.refreshProgressView()
            }
        }, reminderDeletedAction: {
            DispatchQueue.main.async {
                self.refreshProgressView()
            }
        }, remindersChangedAction: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshProgressView()
            }
        })
        self.tableView.dataSource = reminderListDataSource
    }


}

extension ViewController {
    private func refreshProgressView() {
        guard let percentComplete = self.reminderListDataSource?.percentComplete else {
            return
        }
        let totalHeight = progressContainerView.bounds.size.height
        percentCompleteHeightConstraint.constant = totalHeight * CGFloat(percentComplete)
        UIView.animate(withDuration: 0.2) {
            self.progressContainerView.layoutSubviews()
        }
    }

}

fileprivate extension ReminderListDataSource.Filter {
}
