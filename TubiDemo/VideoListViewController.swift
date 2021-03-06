//
//  VideoListViewController.swift
//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

private let reuseIdentifier = "CollectionViewCell"

class VideoListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var videos : [VideoModel]!
    var responseResult : [VideoModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Video"
        configureCollectionView()
        registerCell()
        addSearchController()
        videos = [VideoModel]();
        loadVides("")
    }
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }
    
    func addSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func registerCell() {
        self.collectionView!.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func loadVides(_ text: String) {
        WebApi.getVideosWithcompletionWIthCatetory(text) { (videos, state, error) in
            if state == .SUCCEEDED {
                self.videos = videos
                self.responseResult = videos
                self.collectionView.reloadData()
            }
        }
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configureCell(videos[indexPath.row])        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let vc = DetailCollectionViewController(collectionViewLayout: flowLayout)
        vc.index = indexPath.row
        vc.videList = videos
        self.navigationController?.pushViewController(vc, animated: true)
//        let player = AVPlayer(url: URL(string: videos[indexPath.row].videoUrl)!)
//        let vc = AVPlayerViewController()
//        vc.player = player
//
//        present(vc, animated: true) {
//            vc.player?.play()
//        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        videos = responseResult.filter({( model : VideoModel) -> Bool in
            if searchBarIsEmpty() {
                return true
            } else {
                return model.title.lowercased().contains(searchText.lowercased())
            }
        })
        self.collectionView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension VideoListViewController {
    @objc
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let width = 200.0;
        let h = videos[indexPath.row].height / (videos[indexPath.row].width / width)
        return CGSize(width: width, height: h)
    }
}



extension VideoListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        loadVides(searchBar.text!)
    }
}
