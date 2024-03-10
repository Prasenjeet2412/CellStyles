//
//  SubtitleViewController.swift
//  Assignment2
//
//  Created by Prasenjeet Pandagale on 03/03/24.
//

import UIKit

class SubtitleViewController: UIViewController {
    
    @IBOutlet var studentTableView: UITableView!
    var cellIdentifier = "StudentTableViewCell"
    var studentTableViewCell: StudentTableViewCell?
    var uiNib: UINib?
    var colors: [UIColor] = [.red, .green, .blue, .yellow, .cyan]
    var student = [("1", "Prasenjeet"), ("2", "Krishna"), ("3", "Dipali"), ("4", "Ronak"), ("5", "Pritam")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        registerXIBWithTableView()
        //        randomColor()
    }
    
    func initializeTableView(){
        studentTableView.dataSource = self
    }
    
    func registerXIBWithTableView(){
        uiNib = UINib(nibName: "uiNib", bundle: nil)
        self.studentTableView.register(uiNib!, forCellReuseIdentifier: "cellIdentifier")
    }
}

extension SubtitleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentTableViewCell = (self.studentTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StudentTableViewCell)
        studentTableViewCell?.textLabel?.text = student[indexPath.row].0
        studentTableViewCell?.detailTextLabel?.text = student[indexPath.row].1
        studentTableViewCell?.textLabel?.textColor = UIColor.darkText
        
        let randomColor = colors.randomElement() ?? .orange
        self.studentTableViewCell?.contentView.backgroundColor = randomColor
        
        return studentTableViewCell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            student.remove(at: indexPath.row)
            studentTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
}

  

