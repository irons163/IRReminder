//
//  EditTitleCell.swift
//  IRReminder
//
//  Created by Phil Chang on 2022/7/31.
//  Copyright © 2022 Yahoo. All rights reserved.
//

import UIKit

class EditTitleCell: UITableViewCell {
    typealias TitleChangeAction = (String) -> Void

    @IBOutlet var titleTextField: UITextField!

    private var titleChangeAction: TitleChangeAction?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(title: String, changeAction: @escaping TitleChangeAction) {
        self.titleTextField.text = title
        self.titleChangeAction = changeAction
    }
}

extension EditTitleCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let originalText = textField.text {
            let title = (originalText as NSString).replacingCharacters(in: range, with: string)
            self.titleChangeAction?(title)
        }
        return true
    }
}
