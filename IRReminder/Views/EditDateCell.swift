//
//  EditDateCell.swift
//  IRReminder
//
//  Created by Phil Chang on 2022/7/31.
//  Copyright © 2022 Yahoo. All rights reserved.
//

import UIKit

class EditDateCell: UITableViewCell {
    typealias DateChangeAction = (Date) -> Void

    @IBOutlet var datePicker: UIDatePicker!

    private var dateChangeAction: DateChangeAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(date: Date, changeAction: @escaping DateChangeAction) {
        datePicker.date = date
        self.dateChangeAction = changeAction
    }
}
