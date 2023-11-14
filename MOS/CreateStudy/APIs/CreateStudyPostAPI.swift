//
//  CreateStudyPostAPI.swift
//  MOS
//
//  Created by 김지은 on 2023/11/02.
//

import Foundation
import Alamofire

// JSON 데이터 모델 생성
struct StudyDayEntity: Codable {
    let studyDays: String
}

// 요청 데이터 모델 생성
struct RequestData: Codable {
    let title: String
    let goal: String
    let rules: String
    let quest: String
    let category: String
    let intro: String
    let maxMember: Int
    let mod: String
    let onOff: Bool
    let online: Int?
    let location: String?
    let startDate: String
    let endDate: String
    let studyDayEntities: [StudyDayEntity]
}

class CreateStudyPost {
    static let instance = CreateStudyPost()
    let accessToken = KeyChain.read(account: "MosAccessToken")
    
    func createStudyPosting(parameters: RequestData, handler:@escaping (_ result: CreateStudyResultModel) ->(Void)) {
        if let unwrappedToken = accessToken {
            print(unwrappedToken)
            
            let url = APIConstants.baseURL + "/studyRoom/create"
            let headers:HTTPHeaders = [
                .contentType("application/json"),
                .authorization("Bearer \(unwrappedToken)")
            ]
            
            AF.request(url, method:.post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
                switch response.result {
                case .success(let data):
                    print(String(decoding: data!, as: UTF8.self))
                    _ = String(decoding: data!, as: UTF8.self)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                        print(json)
                        
                        let jsonResult = try
                        JSONDecoder().decode(CreateStudyResultModel.self, from: data!)
                        handler(jsonResult)
                    }catch {
                        print(String(describing:error))
                    }
                case .failure(let error):
                    print(String(String(describing: error)))
                }
            }
        }
    }
}


struct CreateStudyResultModel: Codable {
    let success: Bool
    let message: String
    let roomId: Int
    let status: String
}
