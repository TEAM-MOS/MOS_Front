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
    let authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3NUb2tlbiIsImV4cCI6MTcwMDE1OTA4MCwiZW1haWwiOiJzYWxseWtpbTIwMThAbmF2ZXIuY29tIn0._bWCMI9Zi_z9hL-tdGrhYELt-XFN3Wu0Z4ck6267OUKEkomdqwDqT-9hnSFDwTd1q9nzE4qlAbaXnv2N7lT7uw"

    func recruitingStudyGet(handler: @escaping (_ result: [RecuritingStudyResultModel]) -> Void) {
        let url = APIConstants.baseURL + "/studyRoom/recruiting"
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .authorization("Bearer \(authToken)")
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

