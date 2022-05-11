//
//  HomeViewController.swift
//  Netflix
//
//  Created by THEINPYAE PHYO on 5/9/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var svMenu: UIStackView!
    @IBOutlet var svTVShows: UIStackView!
    @IBOutlet var svMovies: UIStackView!
    
    @IBOutlet var btnTVShows: UIButton!
    @IBOutlet var btnMovies: UIButton!
    
    @IBOutlet var btnNetflix: UIView!
    
    @IBOutlet var tvHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        svMenu.isHidden = false
        svTVShows.isHidden = true
        svMovies.isHidden = true
        
        btnNetflix.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onclickNetflix))
        btnNetflix.addGestureRecognizer(gesture)
        
        tvHome.register(UINib(nibName: ShowNewMovie.identifier, bundle: nil), forCellReuseIdentifier: ShowNewMovie.identifier)
        tvHome.dataSource = self
        tvHome.separatorStyle = .none
        
       
    }
    @objc func onclickNetflix() {
        svMenu.isHidden = false
        svTVShows.isHidden = true
        svMovies.isHidden = true
    }
    @IBAction func btnMovies(_ sender: Any) {
        svMenu.isHidden = true
        svTVShows.isHidden = true
        svMovies.isHidden = false
    }
    
    @IBAction func btnTVShows(_ sender: Any) {
        svMenu.isHidden = true
        svTVShows.isHidden = false
        svMovies.isHidden = true
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowNewMovie.identifier, for: indexPath) as! ShowNewMovie
        return cell
    }
}
