//
//  StorageService.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/24.
//  Copyright © 2019 jikichi. All rights reserved.
//

import Foundation
import FirebaseStorage
import KRProgressHUD
import FirebaseAuth
import FirebaseDatabase

class StorageService {
    static func savePhoto(username: String, uid: String, data: Data, metadata: StorageMetadata, storageProfileRef: StorageReference, dict: Dictionary<String, Any>, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        storageProfileRef.putData(data, metadata: metadata, completion: { (StorageMetadata, error) in
            if error != nil {
                print(error?.localizedDescription)
                onError(error!.localizedDescription)
                KRProgressHUD.showError(withMessage: error?.localizedDescription)
                return
            }
            
            storageProfileRef.downloadURL(completion: { (url, error) in
                if let metaImageUrl = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                        
                        if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
                            changeRequest.photoURL = url
                            changeRequest.displayName = username
                            changeRequest.commitChanges(completion: { (error) in
                                if let error = error {
                                    KRProgressHUD.showError(withMessage: error.localizedDescription)
                                }
                            })
                        }
                    }
                    
                    var dictTemp = dict
                    dictTemp[PROFILE_IMAGE_URL] = metaImageUrl
                    
                    Ref().databaseSpecificUser(uid: uid).updateChildValues(dictTemp, withCompletionBlock: {
                        (error, ref) in
                        if error == nil {
                            onSuccess()
                        } else {
                            onError(error!.localizedDescription)
                        }
                    })
                }
            })
        })
        
    }
}
