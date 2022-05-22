//
//  SearchBookingViewController.swift
//  Room Booking
//
//  Created by Zachary Meissner on 19/5/2022.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fromTimePicker: UIDatePicker!
    @IBOutlet weak var toTimePicker: UIDatePicker!
    @IBOutlet weak var searchButton: RoundButton!
    @IBOutlet weak var containerView: UIView!
    
    var availableRooms = [String]()
    var roomIndex = 0
    
    //@IBOutlet weak var collectionview: UICollectionView!
    var collectionview: UICollectionView!
    var cellId = "Cell"
    
    var dateString = ""
    var fromTime = ""
    var toTime = ""
    var db:BookingDatabase = BookingDatabase(room: BLocation("00_00_000"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        searchButton.setTitle("Search", for: .normal)
        //dateTextField.setSFImage(SFSymbolSystemName: "calender", pointSize: 20, placement: .trailing, imagePadding: 5)
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionViewwithout a layout
        
        // If search button is clicked.... put this into a method

    

        func prepare(imageNo: String, buildingNo: Int, floorNo: Int, roomNo: Int, dateNo: Int, startTime: Int, endTime: Int){
            
        }
    
    }

    @IBAction func searchDatabase(_ sender: Any) {
        
        
        self.db = BookingDatabase(room: BLocation("00_00_000"))
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        dateString = df.string(from: datePicker.date)
        df.dateFormat = "HH:mm"
        fromTime = df.string(from:fromTimePicker.date)
        toTime = df.string(from:toTimePicker.date)
        availableRooms = db.fetchRooms(checkDate: dateString, checkStart: fromTime, checkEnd: toTime)
            
        let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
            timer in
            
            self.availableRooms = self.db.availableRooms
            print(self.db.availableRooms)
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 3, bottom: 330, right: 5)
            layout.itemSize = CGSize(width: self.view.frame.width, height: 147)

            self.collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            self.collectionview.dataSource = self
            self.collectionview.delegate = self
            self.collectionview.register(FreelancerCell.self, forCellWithReuseIdentifier: self.cellId)
            self.collectionview.showsVerticalScrollIndicator = false
            self.collectionview.backgroundColor = UIColor.white
            self.view.addSubview(self.collectionview)
            self.containerView.addSubview(self.collectionview)
        }

        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FreelancerCell
                
                cell.buildingLabel.text = availableRooms[roomIndex]
            cell.dateLabel.text = dateString
            cell.timeLabel.text = fromTime + " - " + toTime
            UserDefaults.standard.set(availableRooms[roomIndex], forKey: "room")
            UserDefaults.standard.set(dateString, forKey: "date")
            UserDefaults.standard.set(fromTime, forKey: "start")
            UserDefaults.standard.set(toTime, forKey: "end")
            cell.confirmButton.addTarget(self, action: #selector(submitButtonAction), for: .touchUpInside)
            
            
                roomIndex = roomIndex + 1
                 
                return cell
            }
    @objc func submitButtonAction(submitButton:UIButton) {
        //print("Button is tapped")
        submitButton.backgroundColor = UIColor.systemGray
        submitButton.setTitle("Booked", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        let bookRoom = UserDefaults.standard.string(forKey: "room")
        let bookDate = UserDefaults.standard.string(forKey: "date")
        let bookStart = UserDefaults.standard.string(forKey: "start")
        let bookEnd = UserDefaults.standard.string(forKey: "end")
        
        self.db = BookingDatabase(room: BLocation(bookRoom!))
        self.db.addBooking(date: bookDate!, startTime: bookStart!, endTime: bookEnd!)
        
    }
    
    // This returns the amount of views
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return availableRooms.count
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
            backgroundColor = UIColor.gray

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






