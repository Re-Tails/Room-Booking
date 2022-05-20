//
//  TimeBookingController.swift
//  Room Booking
//
//  Created by Zachary Meissner on 20/5/2022.
//

import UIKit

class TimeBookingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var timeContainer: UIView!
    
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 330, right: 5)
        layout.itemSize = CGSize(width: 175, height: 25)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(FreelancerCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)
        timeContainer.addSubview(collectionview)
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FreelancerCell
                return cell
            }
    
    // This returns the amount of views
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 68
            }
    
        class FreelancerCell: UICollectionViewCell {

        let timeLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.black
            label.font = UIFont.systemFont(ofSize:(18))
            label.text = "TIME"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()



        let topSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.darkGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let bottomSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.darkGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        let confirmButton: UIButton = {
            let button = UIButton()
            button.setTitle("Free", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize:(18))
            button.setTitleColor(UIColor.black, for: .normal)
            button.backgroundColor = UIColor.white
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(someButtonAction), for: .touchUpInside)
            return button
        }()
            @objc func someButtonAction() {
                //print("Button is tapped")
                confirmButton.backgroundColor = UIColor.systemGray
                confirmButton.setTitle("Booked", for: .normal)
                confirmButton.setTitleColor(UIColor.white, for: .normal)
                
                
            }

        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis  = NSLayoutConstraint.Axis.horizontal
            sv.alignment = UIStackView.Alignment.center
            sv.distribution = UIStackView.Distribution.fillEqually
            sv.translatesAutoresizingMaskIntoConstraints = false;
            return sv
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)

            addViews()
        }

        func addViews(){
            //backgroundColor = UIColor.black

          //  addSubview(profileImageButton)
         //   addSubview(distanceLabel)
            addSubview(timeLabel)
         //   addSubview(ratingLabel)


          //  addSubview(topSeparatorView)
          //  addSubview(bottomSeparatorView)

            // Stack View
            addSubview(confirmButton)
    
            //addSubview(stackView)

            
            //Building/floor/room
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
            timeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
            //pricePerHourLabel.centerYAnchor.constraint(equalTo: showCaseImageView.centerYAnchor).isActive = true


            confirmButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            confirmButton.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 10).isActive = true
            confirmButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
            confirmButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            //confirmButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
            //starttime - endtime
        

            //topSeparatorView.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 10).isActive = true
           // topSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
           // topSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

            //stackView.addArrangedSubview(likeButton)
           // stackView.addArrangedSubview(hireButton)
           // stackView.addArrangedSubview(messageButton)

            //stackView.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 4).isActive = true
           // stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
           // stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

           // bottomSeparatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4).isActive = true
           // bottomSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
           // bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true


        }



        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    }
}



