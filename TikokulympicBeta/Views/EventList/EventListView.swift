//
//  EventListView.swift
//  TikokulympicBeta
//
//  Created by 株丹優一郎 on 2024/09/07.
//

import SwiftUI
import Supabase

struct User: Codable {
    let id: Int
    let created_at: String
    let name: String
    let auth_id: Int
    let token: String
}


struct EventListView: View {
    @State private var title: String = "タイトルを取得してください"
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
            
            if let errorMessage = errorMessage {
                Text("エラー: \(errorMessage)")
                    .foregroundColor(.red)
            }
            Button(action:  {
                Task {
                    do {
                        guard let supabaseURL = APIKeyManager.shared.apiKey(for: "SUPABASE_URL")
                            
                                
                        else {
                            debugPrint("Supabase URL or API Key not found")
                            return
                        }
                        // Supabaseから"title"を取得
                        let client = SupabaseClient(supabaseURL: URL(string: supabaseURL)!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZobnhjc2RnaG9idWRkanB1a3B2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjYwMjQ1NTUsImV4cCI6MjA0MTYwMDU1NX0.dFjRbNFExU8znrqHERbZ0ahNm97soQU2butH3oWjWIE")

                        let response: [User]? = try await client
                            .from("users")
                            .select("*")
                            .execute()
                            .value
                        
                        // 最初のオプションを取得
                        guard let option = response.self else {
                            throw NSError(domain: "SupabaseService", code: 404, userInfo: [NSLocalizedDescriptionKey: "該当するデータが見つかりません。"])
                        }
                        
                        print(response)
                        print(response.self)
                        // UIを更新
//                        DispatchQueue.main.async {
//                            self.title = option.title
//                            self.errorMessage = nil
//                        }
                        
                    } catch {
                        // エラーハンドリング
                        DispatchQueue.main.async {
                            self.errorMessage = error.localizedDescription
                            self.title = "タイトルの取得に失敗しました"
                        }
                        print("タイトルの取得中にエラーが発生しました: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("タイトルを取得")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}
