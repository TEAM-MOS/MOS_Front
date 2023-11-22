//
//  MypageGetAPI.swift
//  MOS
//
//  Created by 김지은 on 2023/11/13.
//

import Foundation
import Alamofire

class MypageGet {
    static let instance = MypageGet()
    let accessToken = KeyChain.read(account: "MosAccessToken")
    
    func mypageGet(handler: @escaping (_ result: MypageResultModel?) -> Void) {
        if let unwrappedToken = accessToken {
            print(unwrappedToken)
            let url = APIConstants.baseURL + "/profile"
            let headers: HTTPHeaders = [
                .contentType("application/json"),
                .authorization("Bearer \(unwrappedToken)")
            ]
            
            AF.request(url, method: .get, headers: headers).response { response in
                switch response.result {
                case .success(let data):
                    do {
                        let jsonResult = try JSONDecoder().decode(MypageResponseModel.self, from: data!)
                        handler(jsonResult.data)
                    } catch {
                        print("Error decoding JSON:", error)
                        handler(nil)
                    }
                case .failure(let error):
                    print("Network request failed:", error)
                    handler(nil)
                }
            }
        }
    }
}

struct MypageResponseModel: Codable {
    let data: MypageResultModel
}

struct MypageResultModel: Codable {
    let id: Int
    let nickname: String?
    let name: String?
    let strDuration: String?
    let endDuration: String?
    let message: String?
    let company: String?
    let tend1: String?
    let tend2: String?
    let roomId: Int?
    let imageUrl: String?
}

