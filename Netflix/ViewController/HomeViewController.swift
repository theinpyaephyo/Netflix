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
    
    @IBOutlet var viewTop: UIView!
    
    @IBOutlet var viewTopConstraint: NSLayoutConstraint!
    
    
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        svMenu.isHidden = false
        svTVShows.isHidden = true
        svMovies.isHidden = true
        
        btnNetflix.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onclickNetflix))
        btnNetflix.addGestureRecognizer(gesture)
        
        //TableView Cell Register
        tvHome.register(UINib(nibName: ShowNewMovie.identifier, bundle: nil), forCellReuseIdentifier: ShowNewMovie.identifier)
        
        tvHome.register(UINib(nibName: MovieLists.identifier, bundle: nil), forCellReuseIdentifier: MovieLists.identifier)
        
        tvHome.dataSource = self
        tvHome.delegate = self
        tvHome.separatorStyle = .none
        
        
       //CollectionView Cell Register
        
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
extension HomeViewController: UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShowNewMovie.identifier, for: indexPath) as! ShowNewMovie
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieLists.identifier, for: indexPath) as! MovieLists
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("lastContentOffset : \(lastContentOffset)")
       
        self.viewTopConstraint.constant = -48 + (-scrollView.contentOffset.y)
       
        if scrollView.contentOffset.y > lastContentOffset {
            print("scrollView.contentOffset.y : \(scrollView.contentOffset.y)")
            UIView.animate(withDuration: 2) {
               
                self.viewTop.alpha = 0
               
            }

            print("Scrolling up")
        } else if scrollView.contentOffset.y <= lastContentOffset{
           
            print("scrollView.contentOffset.y : \(scrollView.contentOffset.y)")
           
            UIView.animate(withDuration: 0.6) {
                self.viewTop.alpha = 1
            }
            

            print("Scrolling Down")
        } else  {
           print("Not Scrolling")
        }
    }
   
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        lastContentOffset = scrollView.contentOffset.y + 0.9
        print("lastContentOffset : \(lastContentOffset)")

    }
}

