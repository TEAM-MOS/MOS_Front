
import Foundation
import Alamofire

struct SignInModel: Encodable {
    var email: String
    var password: String
}

class SignInPost {
    static let instance = SignInPost()
    
    func SignInPosting(parameters: SignInModel, handler:@escaping (_ result: SignInResultModel) ->(Void)){
        let url = APIConstants.baseURL + "/login"
        let headers:HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(url, method:.post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                _ = String(decoding: data!, as: UTF8.self)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    
                    let jsonResult = try
                    JSONDecoder().decode(SignInResultModel.self, from: data!)
                    handler(jsonResult)
                    if let userData = jsonResult.result {
                        KeyChain.create(account: "MosAccessToken", token: userData.jwt)
                    }
                }catch {
                    print(String(describing:error))
                }
            case .failure(let error):
                print(String(String(describing: error)))
            }
        }
    }
}

struct SignInResultModel: Codable {
    let success: Bool
    let message: String?
    let status: Int
    let result: JWTResult?
}

struct JWTResult: Codable {
    let jwt: String
}
