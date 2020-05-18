//
//  Todo.swift
//  TODO
//
//  Created by Hadi on 4/24/20.
//  Copyright © 2020 Hadi. All rights reserved.
//

import Foundation

struct Todo {
    var title: String?
    var des: String?
    var completed: Bool?
}


var todos = [
    Todo(title: "carot", des: "buy", completed: false),
    Todo(title: "bannana", des: "", completed: false),
    Todo(title: "hav", des: "nothing", completed: true),
]
