//
//  ConversationsViewController.swift
//  tcsChat
//
//  Created by Филипп Дюдин on 26.03.17.
//  Copyright © 2017 Филипп Дюдин. All rights reserved.
//

import UIKit

protocol ConversationCellConfiguration: class {
    var name : String? {get set}
    var message :String? {get set}
    var date : Date? {get set}
    var online: Bool? {get set}
    var hasUnreadMessage: Bool? {get set}
}

class ConversationsViewController: UIViewController, UITableViewDataSource, ConversationCellConfiguration {
    
    internal var name: String?
    internal var message: String?
    internal var date: Date?
    internal var online: Bool?
    internal var hasUnreadMessage: Bool?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: "ChatCell")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 10
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        } else {
            return "History"
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.name.text = name
        if message == nil {
            cell.message.text = "No messages yet"
            cell.message.textColor = UIColor.darkGray
        }
        
        if let _ = hasUnreadMessage {
            
            if hasUnreadMessage! {
                cell.message.font = UIFont.boldSystemFont(ofSize: 1)
                cell.message.text = message
            } else {
                cell.message.text = message
            }

        }
        
        if let _ = online { if online! { cell.contentView.backgroundColor = UIColor.yellow } }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        if let _ = date {
          cell.time.text = dateFormatter.string(from: date!)
        }
        return cell
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
