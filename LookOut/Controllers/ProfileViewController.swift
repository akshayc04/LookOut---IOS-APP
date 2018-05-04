//
//  ProfileViewController.swift
//  LookOut
//
//  Created by Akshay on 4/21/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let photoHelper = PhotoHelper()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UITextView!
    @IBOutlet weak var FullName: UITextView!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        updateBtn.layer.cornerRadius = 15
        updateBtn.layer.borderWidth = 1
        updateBtn.layer.borderColor = UIColor.black.cgColor
        
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleProfileImage)))
        profileImage.isUserInteractionEnabled = true
        
         ref = Database.database().reference()
        fetchUserData()
    }
    
    
    //get picture from photo picker
    @objc func handleProfileImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    //set profile pic
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
           // proImg = selectedImage
            profileImage.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func updateBtnTapped(_ sender: Any) {
        
        guard let uname = userName.text else { return }
        guard let fname = FullName.text else { return }
        guard let desc1 = desc.text else { return }
        
        print("update tapped")
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let storageRef = Storage.storage().reference(forURL: "gs://lookout-ca86e.appspot.com").child("profile_images").child(userID)
        if let profileImag = self.profileImage.image, let imageData = UIImageJPEGRepresentation(profileImag, 0.01){
            
            storageRef.putData(imageData, metadata: nil) { (metadata, error) in
                if error != nil{
                    return
                }
                guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
                self.ref.child("profileData").child(userID).updateChildValues(["pImage_url" : profileImageUrl], withCompletionBlock: { (err, ref) in
                    if err != nil {
                        print(err ?? "")
                        return
                    }
                })
            }
        }
        
        let updatesVal = [
            "name": uname,
            "fullname" : fname,
            "desc" : desc1] as [String : String]
        
        self.ref.child("profileData").child(userID).updateChildValues(updatesVal, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err ?? "")
                return
            }
        })
        
        self.ref.child("users").child(userID).updateChildValues(["username": uname], withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err ?? "")
                return
            }
        })
        //self.view.makeToast("Profile Updated", duration: 2.0, position: .center)
    }
    
    @IBAction func addPostBtnTapped(_ sender: Any) {
        photoHelper.presentActionSheet(from: self)
    }
    
    func fetchUserData()
    {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        ref.child("users").child(userID).observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? NSDictionary else { return }
            guard let username = data["username"] as? String else { return }
            self.userName.text = username
        }
        
        
        ref.child("profileData").child(userID).observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? NSDictionary else { return }
            guard let fullname = data["fullname"] as? String else { return }
            guard let desc2 = data["desc"] as? String else { return }
            guard let pimg_url = data["pImage_url"] as? String else { return }
            
            Alamofire.request(pimg_url).responseImage { response in
                
                if let image = response.result.value {
                    self.profileImage.image = image
                }
            }
            self.FullName.text = fullname
            self.desc.text = desc2
        }
 
    }
    
    
}
