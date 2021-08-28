//
//  ThreadsViewController.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import UIKit
import Alamofire

class ThreadsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var direct: DirectOutput?;
    
    @IBOutlet weak var inboxTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.getThreads();
        
        self.title = "Threads";
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.settingsButtonTapped));
    }
    
    @objc func settingsButtonTapped() {
        self.performSegue(withIdentifier: "userSettingSegue", sender: self);
    }
    
    func getThreads() {
        let userDefaults = UserDefaults.standard;
        let cookie = userDefaults.string(forKey: "cookie");
        let appId = userDefaults.string(forKey: "appId");
        let igClaim = userDefaults.string(forKey: "igClaim");
        
        
        let headers: HTTPHeaders = [
            "Cookie": cookie!,
            "X-IG-App-ID": appId!,
            "X-IG-WWW-Claim": igClaim!
        ];
        
        AF.request("https://i.instagram.com/api/v1/direct_v2/inbox",  headers: headers).responseJSON { response in
            guard response.error == nil else {
                print(response.error!);
                return
            }
            guard let data = response.data else {
                print("No Data");
                return
            }
            
            do {
                let decoder = JSONDecoder()
                self.direct = try decoder.decode(DirectOutput.self, from: data)
                print(self.direct ?? "No Data")
                
                self.inboxTableView.reloadData();
                
            } catch {
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ThreadEntryCell", owner: self, options: nil)?.first as! ThreadEntryCell;
        
        if let thread = self.direct?.inbox.threads[ indexPath.row ] {
            cell.threadTitleLabel.text = thread.title
            cell.lastMessageLabel.text = thread.items[ 0 ].text;
        }
        return cell;
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.direct?.inbox.threads.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)");
        
    }
    
    
    
}
