//
//  Reminder.swift
//  IRReminder
//
//  Created by Phil Chang on 2022/7/30.
//  Copyright © 2022 Yahoo. All rights reserved.
//

import Foundation

struct Reminder {
    var id: String
    var title: String
    var dueDate: Date
    var notes: String?
    var isComplete: Bool = false
}
