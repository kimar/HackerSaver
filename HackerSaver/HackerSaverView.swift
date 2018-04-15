//
//  HackerSaverView.swift
//  HackerSaver
//
//  Created by Marcus Kida on 15.04.18.
//  Copyright © 2018 Marcus Kida. All rights reserved.
//

import OnelinerKit
import libHN

class HackerSaverView: OnelinerView {
    override func fetchOneline(_ completion: @escaping (String) -> Void) {
        HNManager.shared().loadPosts(with: .best) { postsArray, nextPageId in
            if let posts = postsArray as? [HNPost]? {
                completion(posts!.randomItem().title)
            }
        }
    }
}

extension Array where Element == HNPost {
    func randomItem() -> HNPost {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}
