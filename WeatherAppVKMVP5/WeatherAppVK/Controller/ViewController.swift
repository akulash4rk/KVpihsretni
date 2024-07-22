//
//  ViewController.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 17.07.2024.
//

import UIKit

class ViewController: UIViewController{
    
    // MARK: - Properties
    
    let backgroundAnimation = GradientBackgroundAnimation()
    var backgroundGradient = CAGradientLayer()
    var sunCloudFogAnimations = SunCloudFogAnimations()
    
    
    var isRain : Bool = false
    var isSnow : Bool = false
    var isSunny : Bool = false
    
    private let collectionViewMain: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundGradient = backgroundAnimation.gradientLayer
        backgroundGradient.bounds = UIScreen.main.bounds
        backgroundGradient.position = view.center
        view.layer.addSublayer(backgroundGradient)
        
        setCloudView()
        setSunriseView()
        setFogView()
        setCollectionView()
        
        let randomAnimationNumber = Int.random(in: 0..<collectionViewMain.numberOfItems(inSection: 0))
        makeWeatherChange(willAnimation: randomAnimationNumber)
    }
    
    // MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        backgroundGradient.bounds = UIScreen.main.bounds
        backgroundGradient.position = view.center
        
        sunCloudFogAnimations.sunView?.bounds = UIScreen.main.bounds
        sunCloudFogAnimations.cloudView?.bounds = UIScreen.main.bounds
        
        
        if isSunny == true {
            sunCloudFogAnimations.sunAnimationIn()
        } else {
            sunCloudFogAnimations.sunAnimationOut()
        }
    }
    
    // MARK: - Subviews
    
    func setCollectionView(){
        view.addSubview(collectionViewMain)
        
        collectionViewMain.dataSource = self
        collectionViewMain.delegate = self
        
        collectionViewMain.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionViewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 256),
            collectionViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewMain.heightAnchor.constraint(equalToConstant: 60),
            collectionViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    func setFogView(){

        if let fogView = sunCloudFogAnimations.fogView {
           
            view.addSubview(fogView)
            fogView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                fogView.topAnchor.constraint(equalTo: view.topAnchor),
                fogView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                fogView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                fogView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
    func setCloudView(){
        
        if let cloudView = sunCloudFogAnimations.cloudView {
            cloudView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(cloudView)
            
            NSLayoutConstraint.activate([
                cloudView.topAnchor.constraint(equalTo: view.topAnchor),
                cloudView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                cloudView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                cloudView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
    func setSunriseView(){
        
        if let sunView = sunCloudFogAnimations.sunView {
            
            sunView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(sunView)
            
            NSLayoutConstraint.activate([
                sunView.topAnchor.constraint(equalTo: view.topAnchor),
                sunView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                sunView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                sunView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
}

    // MARK: - Animations

extension ViewController {
    
    func makeWeatherChange(willAnimation: Int){
        
        switch willAnimation {
            
        case 0 : willAnimation0()
        case 1 : willAnimation1()
        case 2 : willAnimation2()
        case 3 : willAnimation3()
        case 4 : willAnimation4()
        case 5 : willAnimation5()
        case 6: willAnimation6()
            
        default:
            print("default")
            break
        }
        
        func willAnimation0() {
            
            sunCloudFogAnimations.fogAnimationOut()
            
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.sunBackgroundColors)
            sunCloudFogAnimations.sunAnimationIn()
            sunCloudFogAnimations.makeClear()

            isSunny = true
            isRain = false
            isSnow = false
            
            updateAllCells()
        }
        
        
        func willAnimation1() {
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.rainBackgroundColors)
            sunCloudFogAnimations.sunAnimationOut()
            
            sunCloudFogAnimations.fogAnimationOut()
            
            sunCloudFogAnimations.setRain()
            sunCloudFogAnimations.animateCloudsIn()
            
            isSunny = false
            isRain = true
            isSnow = false
            
            updateAllCells()
            
        }
        
        func willAnimation2() {
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.stormBackgroundColors)
            
            sunCloudFogAnimations.sunAnimationOut()
            
            sunCloudFogAnimations.fogAnimationOut()
            
            sunCloudFogAnimations.setStorm()
            sunCloudFogAnimations.animateCloudsIn()
           
            isSunny = false
            isSnow = false
            isRain = false
            
            updateAllCells()
        }
        
        func willAnimation3() {
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.snowBackgroundColors)
            sunCloudFogAnimations.sunAnimationOut()
            
            sunCloudFogAnimations.setSnow()
            sunCloudFogAnimations.animateCloudsIn()
            
            sunCloudFogAnimations.fogAnimationOut()
            
            isSunny = false
            isSnow = true
            isRain = false
            
            updateAllCells()
        }
        
        
        func willAnimation4(){
            
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.cloudsBackgroundColors)
            sunCloudFogAnimations.sunAnimationOut()
            
            sunCloudFogAnimations.makeClear()
            sunCloudFogAnimations.animateCloudsIn()
            
            sunCloudFogAnimations.fogAnimationOut()
            
            isSunny = false
            isRain = false
            isSnow = false
            
            updateAllCells()
        }
        
        func willAnimation5(){
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.snowBackgroundColors)
            sunCloudFogAnimations.sunAnimationOut()
            
            sunCloudFogAnimations.setRainAndStorm()
            sunCloudFogAnimations.animateCloudsIn()
            
            sunCloudFogAnimations.fogAnimationOut()
            
            isSunny = false
            isSnow = false
            isRain = true
            
            updateAllCells()
        }
        
        func willAnimation6(){
            
            sunCloudFogAnimations.fogAnimationIn()
            
            backgroundAnimation.animateGradient(to: BackgroundGradientColors.stormBackgroundColors.reversed())
            sunCloudFogAnimations.sunAnimationOut()
            sunCloudFogAnimations.makeClear()
            
            isSunny = false
            isRain = true
            isSnow = false
            
            updateAllCells()
        }
        
    }

    // Функция, которая обновляет все ячейки в зависимости от того, есть ли дождь/снег
    func updateAllCells() {
        let numberOfSections = collectionViewMain.numberOfSections
        for section in 0..<numberOfSections {
            let numberOfItems = collectionViewMain.numberOfItems(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let cell = collectionViewMain.cellForItem(at: indexPath) as? MyCustomCollectionViewCell {
                    
                    if isRain {
                        cell.animations.rainAnimationIn()
                    } else {
                        cell.animations.rainAnimationOut()
                    }
                    
                    if isSnow {
                        cell.animations.snowAnimationIn()
                    } else {
                        cell.animations.snowAnimationOut()
                    }
                }
            }
        }
    }
    
}


    // MARK: - Collection Delegate

extension ViewController : UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt: IndexPath){
        self.makeWeatherChange(willAnimation: didSelectItemAt.row)
    }
}

    // MARK: - Collection Data Source

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfWeatherName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCustomCollectionViewCell {
            
            //Для анимации дождя/снега на ячейках
            
            if isRain {
                cell.animations.rainAnimationIn()
            } else {
                cell.animations.rainAnimationOut()
            }
            
            if isSnow {
                cell.animations.snowAnimationIn()
            } else {
                cell.animations.snowAnimationOut()
            }
            
            cell.configureCell(currentName: arrayOfWeatherName[indexPath.row])
            return cell
            
        }
        else {
            print("Error : error to set cell as MyCustomCollectionViewCell")
            fatalError()
        }
    }
}

    // MARK: - Collection Delegate Layout

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: collectionViewMain.bounds.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          let edgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
            return edgeInsets

      }
}
