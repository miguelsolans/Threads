//
//  Services.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import Foundation

import Alamofire;

private func getHeaders() -> HTTPHeaders {
    let userDefaults = UserDefaults.standard;
    let cookie = userDefaults.string(forKey: "cookie");
    let appId = userDefaults.string(forKey: "appId");
    let igClaim = userDefaults.string(forKey: "igClaim");
    
    let headers: HTTPHeaders = [
        "Cookie": cookie ?? "",
        "X-IG-App-ID": appId ?? "",
        "X-IG-WWW-Claim": igClaim ?? ""
    ];
    
    return headers;
}

func getInbox( success: @escaping (DirectOutput) -> Void, failure: @escaping () -> Void ) {
    
    
    AF.request("https://i.instagram.com/api/v1/direct_v2/inbox",  headers: getHeaders()).responseJSON { response in
        guard response.error == nil else {
            print(response.error!);
            return
        }
        guard let data = response.data else {
            print("No Data");
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let direct = try decoder.decode(DirectOutput.self, from: data)
            
            success(direct);
            
        } catch {
            print(error)
            
            failure()
        }
    }
}

func getThread(threadId: String, success: @escaping (SingleThreadOutput) -> Void, failure: () -> Void ) {
    // 340282366841710300949128182880292221906
    AF.request("https://i.instagram.com/api/v1/direct_v2/threads/\(threadId)",  headers: getHeaders()).responseJSON { response in
        guard response.error == nil else {
            print(response.error!);
            return
        }
        guard let data = response.data else {
            print("No Data");
            return
        }

        do {
            let decoder = JSONDecoder()
            let direct = try decoder.decode(SingleThreadOutput.self, from: data)

            success(direct);

        } catch {
            print(error)

        }
    }
}
