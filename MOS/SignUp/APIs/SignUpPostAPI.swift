//
//  SignUpPostAPI.swift
//  MOS
//
//  Created by 김지은 on 2023/11/02.
//

import Foundation
import Alamofire 

struct SignUpModel: Encodable {
    var email: String
    var password: String
}

class SignUpPost {
    static let instance = SignUpPost()
    
    func SignUpPosting(parameters: SignUpModel, handler:@escaping (_ result: SignUpResultModel) ->(Void)){
        let url = APIConstants.baseURL + "/sign-up"
        let headers:HTTPHeaders = [
            .contentType("application/json;charset=utf-8")
        ]
        
        AF.request(url, method:.post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                print(String(decoding: data!, as: UTF8.self))
                let resultData = String(decoding: data!, as: UTF8.self)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    print(json)
                    
                    let jsonResult = try
                    JSONDecoder().decode(SignUpResultModel.self, from: data!)
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

struct SignUpResultModel: Codable {
    let success: Bool
    let message : String
    let status : Int
}
