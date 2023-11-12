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
    let authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3NUb2tlbiIsImV4cCI6MTcwMDE1OTA4MCwiZW1haWwiOiJzYWxseWtpbTIwMThAbmF2ZXIuY29tIn0._bWCMI9Zi_z9hL-tdGrhYELt-XFN3Wu0Z4ck6267OUKEkomdqwDqT-9hnSFDwTd1q9nzE4qlAbaXnv2N7lT7uw"

    func mypageGet(handler: @escaping (_ result: [MypageResultModel]) -> Void) {
        let url = APIConstants.baseURL + "/profile"
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .authorization("Bearer \(authToken)")
        ]

        AF.request(url, method: .get, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                print(String(decoding: data!, as: UTF8.self))
                do {
                    let jsonResult = try JSONDecoder().decode([MypageResultModel].self, from: data!)
                    handler(jsonResult)
                } catch {
                    print("Error decoding JSON:", error)
                }
            case .failure(let error):
                print("Network request failed:", error)
            }
        }
    }
}

struct MypageResultModel: Codable {
    let id: Int
    let nickname: String
    let name: String
    let strDuration: String
    let endDuration: String
    let message: String
    let company: String
    let tend1: String
    let tend2: String
    let roomId: Int?
    let imageUrl: String
}
