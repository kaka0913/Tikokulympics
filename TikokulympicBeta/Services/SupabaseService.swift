//
//  SupabaseService.swift
//  TikokulympicBeta
//
//  Created by 株丹優一郎 on 2024/09/18.
//

import Foundation
import Supabase

class SupabaseClientManager {
    static let shared = SupabaseClientManager()
    var client: SupabaseClient?

    private init() {
        guard let supabaseURL = APIKeyManager.shared.apiKey(for: "SUPABASE_URL")
            
                
        else {
            debugPrint("Supabase URL or API Key not found")
            return
        }
        let supabaseApiKey =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZobnhjc2RnaG9idWRkanB1a3B2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjYwMjQ1NTUsImV4cCI6MjA0MTYwMDU1NX0.dFjRbNFExU8znrqHERbZ0ahNm97soQU2butH3oWjWIE"
        print("-----------")
        print(supabaseURL)
        print(supabaseApiKey)


        client = SupabaseClient(supabaseURL: URL(string: supabaseURL)!, supabaseKey: supabaseApiKey)
        print(client)
        debugPrint("SupabaseClient initialized")
    }

    func getAccessToken() async throws -> String {
        guard let session = try await client?.auth.session else {
            print("トークン取得失敗: ユーザーがサインインしていません")
            throw NSError(
                domain: "SupabaseClientManager", code: 0,
                userInfo: [NSLocalizedDescriptionKey: "No user session found"])
        }
        let accessToken = session.accessToken
        print("アクセストークン取得成功: \(accessToken)")
        return accessToken

    }
}
