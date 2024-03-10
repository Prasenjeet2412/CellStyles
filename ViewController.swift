//
//  ViewController.swift
//  Assignment2
//
//  Created by Prasenjeet Pandagale on 03/03/24.
//

import UIKit

class ViewController: UIViewController {
    var cellIdentifier = "StudentTableViewCell"
    var studentTableViewCell: StudentTableViewCell?
    var uiNib: UINib?
    var colors: [UIColor] = [.red, .green, .blue, .yellow, .cyan]
    var student = ["Prasenjeet", "Krishna", "Dipali", "Ronak", "Pritam"]
    @IBOutlet var studentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
    }
    
    func initializeTableView(){
        studentTableView.dataSource = self
        //studentTableView.delegate = self
    }
    
    func registerXIBWithTableView(){
        uiNib = UINib(nibName: "uiNib", bundle: nil)
        self.studentTableView.register(uiNib!, forCellReuseIdentifier: "cellIdentifier")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentTableViewCell = (self.studentTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StudentTableViewCell)
        studentTableViewCell?.textLabel?.text = student[indexPath.row]
        studentTableViewCell?.textLabel?.textColor = UIColor.darkText
        
        let randomColor = colors.randomElement() ?? .orange
        self.studentTableViewCell?.contentView.backgroundColor = randomColor
        
        return studentTableViewCell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            studentTableView.beginUpdates()
            student.remove(at: indexPath.row)
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            studentTableView.endUpdates()
        }
    }
}


