//
//  SearchBookingViewController.swift
//  Room Booking
//
//  Created by Zachary Meissner on 19/5/2022.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var dateTextField: RoundTextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var searchButton: RoundButton!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    //@IBOutlet weak var collectionview: UICollectionView!
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        searchButton.setTitle("Search", for: .normal)
        dateTextField.setSFImage(SFSymbolSystemName: "calender", pointSize: 20, placement: .trailing, imagePadding: 5)
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionViewwithout a layout
        
        // If search button is clicked.... put this into a method

    

        func prepare(imageNo: String, buildingNo: Int, floorNo: Int, roomNo: Int, dateNo: Int, startTime: Int, endTime: Int){
            
        }
    
    }

    @IBAction func searchDatabase(_ sender: Any) {
        
        // this function looks at the values of input and does stuff
        func lookAtDatabase(){
            
        }
        
        
        
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 330, right: 5)
        layout.itemSize = CGSize(width: view.frame.width, height: 147)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(FreelancerCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)
        containerView.addSubview(collectionview)
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FreelancerCell
                return cell
            }
    
    // This returns the amount of views
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 4
            }
    
        class FreelancerCell: UICollectionViewCell {

            let buildingImageView: UIImageView = {
            
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.white
            imageView.image = UIImage(named: "image 3")
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            return imageView
        }()
        
        let buildingLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize:(18))
            label.text = "Building/floor/room"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let dateLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize:(14))
            label.textColor = UIColor.white
            label.text = "Date: "
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        let timeLabel: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize:(14))
            label.text = "Starttime - Endtime"
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
            button.setTitle("Confirm Booking", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize:(18))
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.lightGray
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()



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
            backgroundColor = UIColor.black

          //  addSubview(profileImageButton)
            addSubview(dateLabel)
         //   addSubview(distanceLabel)
            addSubview(buildingLabel)
         //   addSubview(ratingLabel)
            addSubview(buildingImageView)
            addSubview(timeLabel)

          //  addSubview(topSeparatorView)
          //  addSubview(bottomSeparatorView)

            // Stack View
            addSubview(confirmButton)
    
            //addSubview(stackView)

            //Date:
            dateLabel.topAnchor.constraint(equalTo: buildingLabel.bottomAnchor, constant: 15).isActive = true
            dateLabel.leftAnchor.constraint(equalTo: buildingLabel.leftAnchor).isActive = true
            
            //Building/floor/room
            buildingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
            buildingLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
            //pricePerHourLabel.centerYAnchor.constraint(equalTo: showCaseImageView.centerYAnchor).isActive = true

            buildingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            buildingImageView.rightAnchor.constraint(equalTo: buildingLabel.leftAnchor, constant: -20).isActive = true
            buildingImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            buildingImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true

            confirmButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10).isActive = true
            confirmButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -2).isActive = true
            
            //starttime - endtime
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15).isActive = true
            timeLabel.leftAnchor.constraint(equalTo: buildingLabel.leftAnchor).isActive = true

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






