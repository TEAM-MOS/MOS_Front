//
//  RecruitingStudyGetAPI.swift
//  MOS
//
//  Created by 김지은 on 2023/11/11.
//

import Foundation
import Alamofire


import Foundation
import Alamofire

class RecruitingStudyGet {
    static let instance = RecruitingStudyGet()
    let authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhY2Nlc3NUb2tlbiIsImV4cCI6MTcwMDA0OTc3MSwiZW1haWwiOiJzYWxseWtpbTIwMThAbmF2ZXIuY29tIn0.enKrICEpOGuad5d_gD2Falw6tn_BaT4J5OK6pg1D_b9FC1clxdj243nHrERHZW3Y2vFnk-5cgUWKHODQ9YZrew"

    func recruitingStudyGet(handler: @escaping (_ result: RecuritingStudyResultModel) -> Void) {
        let url = APIConstants.baseURL + "/studyRoom/recruiting"
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .authorization("Bearer \(authToken)")
        ]

        AF.request(url, method: .get, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                print(String(decoding: data!, as: UTF8.self))
                _ = String(decoding: data!, as: UTF8.self)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)

                    let jsonResult = try JSONDecoder().decode(RecuritingStudyResultModel.self, from: data!)
                    handler(jsonResult)
                } catch {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

struct RecuritingStudyResultModel: Codable {
    let title: String
    let category: String
    let memberNum: Int
    let maxMember: Int
    let location: String
    let online: Int
    let startDate: String
    let endDate: String
}

