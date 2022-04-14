//
//  OnboardingViewController.swift
//  MojadiApp
//
//  Created by yoga arie on 04/04/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    
    var slide :[OnboardingSlide] = [
        OnboardingSlide(title: "Kembangkan kemampuanmu di bidang apapun", image: "landing"),
        OnboardingSlide(title: "Kembangkan kemampuanmu di bidang apapun", image: "landing"),
        OnboardingSlide(title: "Kembangkan kemampuanmu di bidang apapun", image: "landing")]
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slide.count - 1 {
                nextBtn.setTitle("Sign In", for: .normal)
                
            } else if currentPage == 0  {
                nextBtn.setTitle("Next ", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func buttonColor(){
        nextBtn.setTitleColor(.white, for: .normal)
        
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        if currentPage == slide.count - 1{
            navigateToLogin()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
       
    
    

   

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "on_cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide[indexPath.row])
        cell.slideTitleLabel.textColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        
    }
     
}
