//
//  ViewController.swift
//  TODO
//
//  Created by Hadi on 4/24/20.
//  Copyright © 2020 Hadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,
    CreateViewControllerDelegate{
    
    
    func createViewControllerDidCancel(_ controller: CreateViewController) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func createViewController(_ controller: CreateViewController, didFinishCreating item: Todo) {
        
        let index = IndexPath(row: todos.count, section: 0)
        todos.append(item)
        tableview.insertRows(at: [index], with: .automatic)
        navigationController?.popViewController(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "moveToCreate" {
            let controller = segue.destination as! CreateViewController
            controller.delegate = self
        }
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    @IBAction func addItem(_ sender: Any) {
        
        let index = todos.count
        
        let t = Todo(title: "hi", des: "no", completed: true)
        todos.append(t)
        let indexpath = IndexPath(row: index, section: 0)
        tableview.insertRows(at: [indexpath], with: .left)
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func newTodo(_ sender: UIBarButtonItem) {
        let viewC = CreateViewController()
        viewC.modalPresentationStyle = .formSheet
        viewC.modalTransitionStyle = .crossDissolve
        present(viewC, animated: true) {
            print("im here")
            self.tableview.reloadData()
        }
    }
    
    
    //MARK:- tableView related functions
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    //for switching checkmark
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.row].completed?.toggle()
        tableView.reloadData()
        
    }
    
    //build cells for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if todos[indexPath.row].completed!  {
            cell.accessoryType = .checkmark
            cell.tintColor = .green
        }
        cell.textLabel?.text = todos[indexPath.row].title!
        return cell
        
    }
    
    //MARK:- lifecycles methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
    }
    
}

