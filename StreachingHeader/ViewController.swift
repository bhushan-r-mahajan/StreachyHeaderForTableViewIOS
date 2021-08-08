//
//  ViewController.swift
//  StreachingHeader
//
//  Created by Gadgetzone on 02/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    //MARK: - Properties
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return table
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    let imageView1: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "a.circle")
        return iv
    }()
    
    let imageView2: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.image = UIImage(systemName: "a.circle")
        return iv
    }()
    
    let animeNames = ["One Piece", "Dragon Ball Z", "Naruto", "Death Note", "Tokyo Ghoul", "Hunter x Hunter", "Fire Force", "7 Deadly Sins", "Dr.Stone", "Vinland Saga", "My Hero Academia", "Jujutsu Kaisen", "Tokyo Rvenegers", "Deamon Slayer", "Black Clover", "Slime", "Overlord", "Bleach", "Code Geuas", "Haikyuu", "Kuroko no Basket", "Digimon", "Pokemon", "BayBlade", "Attack On Titan", "Fairy Tail", "The Rising of the Shield Hero", "One Punch Man", "Mob Psycho", "High School DXD", "Sword Art Online", "Gintama", "Full Metal Alchemist"]
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    //MARK: - Configure Functions
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        
        view.addSubview(containerView)
        containerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        containerView.addSubview(imageView1)
        containerView.addSubview(imageView2)
    }
    
    //MARK: - Tableview Delegate & Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = animeNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        let height = max(y, 120)
        let x = (view.frame.width / 2) - ((height - 100) / 2)
        if y >= 120 {
            containerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: height)
            imageView2.isHidden = true
            imageView1.isHidden = false
            imageView1.frame = CGRect(x: x, y: 60, width: height - 100, height: height - 100)
        } else {
            imageView1.isHidden = true
            imageView2.isHidden = false
            imageView2.frame = CGRect(x: 20, y: 42, width: 80, height: 80)
        }
    }
}

