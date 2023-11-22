//
//  RecruitingStudyGetAPI.swift
//  MOS
//
//  Created by 김지은 on 2023/11/11.
//
import Foundation
import Alamofire

class RecruitingStudyGet {
    static let instance = RecruitingStudyGet()
    let accessToken = KeyChain.read(account: "MosAccessToken")

    func recruitingStudyGet(handler: @escaping (_ result: [RecuritingStudyResultModel]) -> Void) {
        if let unwrappedToken = accessToken {
            print(unwrappedToken)
            
            let url = APIConstants.baseURL + "/studyRoom/recruiting"
            let headers: HTTPHeaders = [
                .contentType("application/json"),
                .authorization("Bearer \(unwrappedToken)")
            ]

            AF.request(url, method: .get, headers: headers).response { response in
                switch response.result {
                case .success(let data):
                    print(String(decoding: data!, as: UTF8.self))
                    do {
                        let jsonResult = try JSONDecoder().decode([RecuritingStudyResultModel].self, from: data!)
                        handler(jsonResult)
                    } catch {
                        print("Error decoding JSON:", error)
                    }
                case .failure(let error):
                    print("Network request failed:", error)
                }
            }
        } else {
            print("Error: AccessToken is nil")
            // Handle the case where accessToken is nil, for example, request a new token or handle the error appropriately.
        }
    }
}

struct RecuritingStudyResultModel: Codable {
    let title: String
    let category: String
    let memberNum: Int
    let maxMember: Int
    let location: String?
    let online: Int
    let startDate: String
    let endDate: String
    let leaderImageUrl: String?
}

