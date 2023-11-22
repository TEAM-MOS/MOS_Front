//
//  KeyChain.swift
//  MOS
//
//  Created by yeonsu on 11/6/23.
//

import Foundation
import Security

// MARK: - 키체인(로그인 토큰 저장)

class KeyChain {
    // Create
    class func create(account: String, token: String) -> Bool {
        let createQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            // kSecAttrService: server,
            kSecAttrAccount: account,
            kSecValueData: token.data(using: .utf8) as Any
        ]

        let updateItem: Bool = {
            let status: OSStatus = SecItemAdd(createQuery, nil)
            if status == errSecSuccess {
                return true
            } else if status == errSecDuplicateItem {
                return update(account: account, newToken: token)
            }
            print("addItem Error: \(status.description)")
            return false
        }()

        return updateItem
    }

    class func update(account: String, newToken: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]

        let attributes: [String: Any] = [
            kSecValueData as String: newToken.data(using: .utf8) as Any
        ]

        if SecItemUpdate(query as CFDictionary, attributes as CFDictionary) == noErr {
            print("MosKeychain: Token has changed")
            return true
        } else {
            // print("Something went wrong trying to update the password")
            return false
        }
    }

    // Read
    class func read(account: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            // kSecAttrService: server,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue as Any,  // CFData 타입으로 불러오라는 의미
            kSecMatchLimit as String: kSecMatchLimitOne       // 중복되는 경우, 하나의 값만 불러오라는 의미
        ]

        var dataTypeRef: CFTypeRef?
        var retrieveToken: String = "Something went wrong trying to find the user in the keychain"

        if SecItemCopyMatching(query as CFDictionary, &dataTypeRef) == noErr,
           let tokenData = dataTypeRef as? Data,
           let token = String(data: tokenData, encoding: .utf8) {
            retrieveToken = token
        } else {
            print(retrieveToken)
        }
        return retrieveToken
    }

    // Delete
    class func delete(key: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        let status = SecItemDelete(query)
        assert(status == noErr, "failed to delete the value, status code = \(status)")
    }
}

