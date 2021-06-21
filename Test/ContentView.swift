//
//  ContentView.swift
//  Test
//
//  Created by phonwalai on 21/6/2564 BE.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

//UI View...

struct ContentView: View {
    
    @ObservedObject var list = getData()
    var body: some View {
        
        NavigationView{
            List(list.datas){ i in
                
                NavigationLink(destination:
                
                    webView(url: i.url)
                                .navigationBarTitle("",displayMode: .inline)) {
                    
                    HStack(spacing: 15){
                        
                        
                        if i.image != ""{
                            
                            WebImage(url : URL(string: i.image)!,options: .highPriority,context: nil)
                                .resizable()
                                .frame(width: 110, height: 135)
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                        Text(i.title)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,15)
                }
                
            }
            .navigationBarTitle("Anime")
        }
    }
}


//Model...
struct dataType : Identifiable {
    
    var id: String
    var title : String
    var url : String
    var image : String
}

//Fetch data...
class getData: ObservableObject {
    
    @Published var datas = [dataType]()
    init() {
        
        let source = "https://api.jikan.moe/v3/user/Nekomata1037/animelist/all"
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){(data, _, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            for i in json["anime"]{
                
                let title = i.1["title"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["image_url"].stringValue
                let id = i.1["mal_id"].stringValue
                
                DispatchQueue.main.async {
                    
                    self.datas.append(dataType(id: id ,title: title, url: url, image: image))
                }
                
            }
        }
        .resume()
    }
}

//Ater user tap it  will go to anime details.
struct webView : UIViewRepresentable {
    
    var url : String
    func makeUIView(context: UIViewRepresentableContext<webView>) ->
        
            WKWebView{
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
            
        }
    
    func updateUIView(_ uiView: WKWebView,context:
            UIViewRepresentableContext<webView>){
        }
}


