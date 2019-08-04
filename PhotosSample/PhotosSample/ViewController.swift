//
//  ViewController.swift
//  PhotosSample
//
//  Created by Lyunho Kim on 01/08/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet var photosTableView: UITableView!
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    
    let cellIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch(photoAuthorizationStatus) {
        case .authorized:
            print("접근 권한 있음")
            requestCollection()
            photosTableView.reloadData()
        case .denied:
            print("접근 권한 없음")
        case .notDetermined:
            print("접근 권한 결정되지 않았음")
            PHPhotoLibrary.requestAuthorization { (status) in
                switch(status) {
                case .authorized:
                    OperationQueue.main.addOperation {
                        self.requestCollection()
                        self.photosTableView.reloadData()
                    }
                case .denied:
                    print("접근을 거절함")
                default:
                    ()
                }
            }
        case .restricted:
            print("접근이 제한됨")
        default:
            ()
        }
        
        PHPhotoLibrary.shared().register(self)
        
    }
    
    
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        guard let _ = cameraRoll.firstObject else { return }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(with: fetchOptions)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResult?.countOfAssets(with: .image) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PhotoTableViewCell
        
        let phAsset = fetchResult.object(at: indexPath.row)
        imageManager.requestImage(for: phAsset,
                                  targetSize: CGSize(width: 50, height: 50),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: { (image, _) in
                                    cell.photo.image = image
            })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let phAsset = fetchResult.object(at: indexPath.row)
            
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.deleteAssets([phAsset] as NSArray)
            }) { (isDeleted, error) in
                print("completion handler 호출됨")
                if let err = error {
                    print(err.localizedDescription)
                }
                
                if isDeleted {
                    print("삭제됨")
                } else {
                    print("삭제 실패함")
                }
            }
        }
    }
}


extension ViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        
        print("옵저버 호출됨")
        
        guard let _ = fetchResult else { print("fetchResult: nil"); return }
        
        guard let changes = changeInstance.changeDetails(for: fetchResult) else { return }
        
        fetchResult = changes.fetchResultAfterChanges
        
        OperationQueue.main.addOperation {
            self.photosTableView.reloadData()
        }
    }
}
