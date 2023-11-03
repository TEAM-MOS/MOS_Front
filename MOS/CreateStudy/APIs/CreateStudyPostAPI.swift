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
    
    func createStudyPosting(parameters: RequestData, handler: @escaping (Result<CreateStudyResultModel, Error>) -> Void) {
        let url = APIConstants.baseURL + "/studyRoom/create"
        let headers: HTTPHeaders = [
            .contentType("application/json;charset=utf-8")
        ]
        
        do {
            let jsonData = try JSONEncoder().encode(parameters)
            
            AF.request(url, method: .post, parameters: jsonData, encoder: JSONParameterEncoder.default, headers: headers)
                .responseDecodable(of: CreateStudyResultModel.self) { response in
                    switch response.result {
                    case .success(let result):
                        handler(.success(result))
                    case .failure(let error):
                        handler(.failure(error))
                    }
                }
        } catch {
            handler(.failure(error))
        }
    }
}

struct CreateStudyResultModel: Codable {
    let success: Bool
    let message: String
    let status: Int
}
