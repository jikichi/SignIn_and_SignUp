//
//  UserApi.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/24.
//  Copyright © 2019 jikichi. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import KRProgressHUD
import FirebaseStorage

class UserApi {
    
    func signIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            print(authData?.user.uid)
            onSuccess()
        }
    }
    
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (AuthDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                KRProgressHUD.showError(withMessage: error!.localizedDescription)
                return
            }
            if let authData = AuthDataResult {
                print(authData.user.email)
                let dict: Dictionary<String, Any> = [
                    UID: authData.user.uid,
                    EMAIL: authData.user.email,
                    USERNAME: username,
                    PROFILE_IMAGE_URL: "",
                    STATUS: "Welcome to Sign In or Sign Up"
                ]
                
                guard let imageSelected = image else {
                    print("Avatar is nil")
                    KRProgressHUD.showError(withMessage: ERROR_EMPTY_PHOTO)
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                
                StorageService.savePhoto(username: username, uid: authData.user.uid, data: imageData, metadata: metadata, storageProfileRef: storageProfile, dict: dict, onSuccess: {
                    onSuccess()
                }, onError: { (errorMessage) in
                    onError(errorMessage)
                })
                
            }
        }
    }
}
