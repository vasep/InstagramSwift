//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Vasil Panov on 20.2.21.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handle: (() -> Void)
}
///View Controller to show User Settings
final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        
        return tableView
    }()
    
    // Two dimentional array (array of arrays)
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
            }]
        data.append(section)
    }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure you want to log out?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                            style: .destructive,handler: { _ in
                                                AuthManager.shared.logOut(completion: { success in
                                                    DispatchQueue.main.async {
                                                        if success {
                                                            //present logging screen
                                                            //Show log in
                                                            let loginVC = LoginViewController()
                                                            loginVC.modalPresentationStyle = .fullScreen
                                                            self.present(loginVC, animated: false) {
                                                                self.navigationController?.popToRootViewController(animated: false)
                                                                self.tabBarController?.selectedIndex = 0
                                                            }
                                                        } else {
                                                            // error
                                                            fatalError("Could not log out user")
                                                        }
                                                    }
                                                })
                                            }))
        // iPad presentation
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //        handle cell selection
        data[indexPath.section][indexPath.row].handle()
    }
    
}
