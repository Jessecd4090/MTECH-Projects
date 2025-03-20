//
//  AddRegistrationTableViewController.swift
//  HotelCodable
//
//  Created by Jestin Dorius on 3/17/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {

    var roomType: RoomType?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var roomTypeDetailLabel: UILabel!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date.now)
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        
        updateDateViews()
        updateRoomType()
    }
    
    @IBAction func datePickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    @IBSegueAction func segueToRoomTypeSelection(_ coder: NSCoder) -> RoomTypeSelectionTableViewController? {
        let roomTypeSelectionVC = RoomTypeSelectionTableViewController(coder: coder)
        
        roomTypeSelectionVC?.roomType = self.roomType
        roomTypeSelectionVC.delegate = self
        
        return roomTypeSelectionVC
    }
    
    @IBAction func doneBarButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
    }
    
    func updateDateViews() {
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date + 14)
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateRoomType() {
        if let roomType = self.roomType {
            roomTypeDetailLabel.text = roomType.name
        } else {
            roomTypeDetailLabel.text = "Not Set"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == checkInDateLabelIndexPath && isCheckInDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
            
        } else if indexPath == checkOutDateLabelIndexPath && isCheckOutDatePickerVisible == false {
            isCheckOutDatePickerVisible.toggle()
            
        } else if indexPath == checkInDateLabelIndexPath {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelIndexPath {
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

//MARK: EXTENSION

extension AddRegistrationTableViewController: RoomTypeSelectionDelegate {
    func RoomTypeSelectionTableViewController(_ controller: RoomTypeSelectionTableViewController, didSelectRoomType roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
}
