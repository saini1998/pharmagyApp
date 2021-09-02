//
//  ContentView.swift
//  ImarticusTestApp
//
//  Created by Aaryaman Saini on 01/09/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    @State var searchText = ""
    @State var issearching = false
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            GeometryReader{ geometry in
                VStack{
                    Spacer()
                    switch viewRouter.currentPage{
                    case .home:
                        HomePageView(width: geometry.size.width, height: geometry.size.width)
                    case .calendar:
                        CalenderPage(searchText: $searchText, issearching: $issearching, width: geometry.size.width/19, height: geometry.size.width/19)
                    case .clock:
                        ClockView()
                    case .profile:
                        Text("Profile")
                    }
                    Spacer()
                    ZStack{
                        if showPopUp{
                            PlusMenu(widthAndHeight: geometry.size.width/16)
                                .offset(y: -geometry.size.height/6)
                        }
                        HStack{
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/11, height: geometry.size.height/28, systemIconName: "house")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .calendar, width: geometry.size.width/11, height: geometry.size.height/28, systemIconName: "calendar")
                            ZStack{
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width/12, height: geometry.size.width/12)
                                    .shadow(radius: 2)
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width/14-13, height: geometry.size.width/14-13)
                                    .foregroundColor(.blue)
                                    .rotationEffect(Angle(degrees: showPopUp ? 90:0))
                            }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .clock, width: geometry.size.width/11, height: geometry.size.height/28, systemIconName: "clock")
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/11, height: geometry.size.height/28, systemIconName: "person")
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .background(Color(.white))
                        .shadow(radius: 5)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
        
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
        
//        ClockView()
    }
}

struct ClockView: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Map")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 50))
                .padding(.leading, 220)
            GeometryReader { proxy in
                MapView(coordinate: CLLocationCoordinate2D(latitude: 53.341238015829624, longitude: -6.266652578162282))
                    .frame(width: proxy.size.width/1, height: proxy.size.height/1)
                    .offset(x: 200, y: 30)
            }
            
        }
        
    }
}

struct HomePageView: View{
    
    let width, height: CGFloat
    
    var body: some View{
        
        ZStack{
            
//            LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x093D87), Color(hex: 0x2D79E6)]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.top)
            
            
//            Rectangle()
//                .fill(Color(hex: 0x0C4492))
//                .frame(width: 700, height: 500)
//                .offset(x: 100, y: 270)
//
            
            VStack{
                Text("Today")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding(.bottom, 75)
                
                VStack(alignment: .leading){
                    Text("Office No. 248")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(.bottom, 1)
                    Text("3 patients")
                        .bold()
                        .foregroundColor(Color(hex: 0xC2DDFF))
                        .font(.system(size: 15))
                }.padding(.trailing, 220)
                .padding()
                
                
                ZStack{
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [ Color(hex: 0x2D79E6), Color(hex: 0x053476)]), center: .trailing, startRadius: 5, endRadius: 180))
                        .overlay(Circle().stroke(Color.blue, lineWidth: 10))
                        .frame(width: width/3, height: height/3)
                        .shadow(radius: 2)
                        .offset(x: 0, y: 40)
                    Circle()
                        .fill(Color(hex: 0x134C9D))
                        .frame(width: width/5, height: height/5)
                        .offset(x: 0, y: 40)
                    VStack{
                        Text("2:45")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        Text("pm")
                            .foregroundColor(Color(hex: 0xC5E5ED))
                            .font(.system(size: 20))
                    }
                    .offset(x: 0, y: 40)
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: width/18, height: height/18)
                            .shadow(radius: 8)
                        Image(systemName: "ear.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(15)
                            .frame(width: width/16, height: height/16)
                            .foregroundColor(.white)
                    }
                    .offset(x: 60, y: -80)
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: width/18, height: height/18)
                            .shadow(radius: 8)
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(15)
                            .frame(width: width/16, height: height/16)
                            .foregroundColor(.white)
                    }
                    .offset(x: -80, y: 145)
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: width/18, height: height/18)
                            .shadow(radius: 8)
                        Image(systemName: "greetingcard.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(15)
                            .frame(width: width/16, height: height/16)
                            .foregroundColor(.white)
                    }
                    .offset(x: 0, y: 180)
                    
                    
                }
                
                Spacer()
            }
            
        }
        
    }
    
}

struct CalenderPage: View{
    
    @Binding var searchText: String
    @Binding var issearching: Bool
    
    @State private var avatarImage = UIImage(named: "me")!
    
    @State private var line = UIImage(named: "line")!
    
    let width, height: CGFloat
    
    var body: some View{
        
        VStack{
            
            //MARK: - Search Bar and Photo Thumbnail
            
            HStack(spacing: 5){
                SearchBar(searchText: $searchText, issearching: $issearching)
                
                Image(uiImage: avatarImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .padding()
                
                
            }
            .padding(.leading, 200)
            .padding(.trailing, 200)
            
            //MARK: - My Patients and Today
            
            HStack(spacing: 100){
                VStack(alignment: .leading){
                    Text("My Patients")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text("12 total")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: 0xc2ddff))
                }
                
                
                
                HStack{
                    Text("Today")
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                }
                .frame(width: 70, height: 15)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue),  Color(hex: 0x1b69c7)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
                .overlay(
                    HStack{
                        Spacer()
                        Image(systemName: "arrow.down")
                    }
                    
                    .padding(.horizontal, 32)
                    .foregroundColor(.white)
                )
                
            }
            
            //MARK: - Horizontal Scroll
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(0 ..< 5) { item in
                        CardView()
                    }
                }
                .padding()
            }
            
            //MARK: - Timeline
            
            HStack(){
                VStack(spacing: 15){
                    Text("Time")
                        .foregroundColor(Color(hex: 0x2a2d36))
                        .padding(.top, 0)
                        .padding(.bottom, 0)
                    Text("8:00")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("8:30")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("9:00")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("9:30")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("10:00")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("10:30")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("11:00")
                        .foregroundColor(Color(hex: 0xb0bed4))
                        .padding(.bottom, 10)
                    Text("11:30")
                        .foregroundColor(Color(hex: 0xb0bed4))
                    //                        .padding(.bottom, 10)
                }
                
                Image(uiImage: line)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 130)
                    .padding(.top, 10)
                
                VStack(alignment: .leading){
                    Text("Events")
                        .foregroundColor(Color(hex: 0x2a2d36))
                        .padding(.bottom, 13)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 16){
                            ItemView(width: width, height: height, iconLabel: "pencil", patientName: "Nellie Lawrence", time: "8:00 AM - 8:40 AM")
                            ItemView(width: width, height: height, iconLabel: "calendar.badge.exclamationmark", patientName: "Francisco Elliot", time: "9:00 AM - 9:50 AM")
                            ItemView(width: width, height: height, iconLabel: "pencil", patientName: "Isaac Alexander", time: "10:00 AM - 10:40 AM")
                            ItemView(width: width, height: height, iconLabel: "building.columns.fill", patientName: "Veera Hopkins", time: "11:00 AM - 11:45 AM")
                        }
                    }
                }
                
            }
            .padding(.leading, -20)
        }
        
    }
}

struct ItemView: View{
    
    let width, height: CGFloat
    let iconLabel, patientName, time: String
    
    var body: some View{
        HStack{
            
            ZStack{
                Circle()
                    .foregroundColor(Color(hex: 0xD4E6FF))
                    .frame(width: width, height: height)
                Image(systemName: iconLabel)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width/(19-17), height: height/(19-17))
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading){
                Text(patientName)
                    .bold()
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "clock")
                        .foregroundColor(Color(hex: 0x8193AE))
                        .font(.system(size: 12))
                    Text(time)
                        .foregroundColor(Color(hex: 0x8193AE))
                        .font(.system(size: 12))
                    
                }
                
            }
            
        }
        .padding(.all)
        .frame(width: 250, height: 70)
        .background(Color(.white))
        .cornerRadius(15)
        
    }
}

struct CardView: View{
    
    @State private var i1 = UIImage(named: "dw")!
    @State private var i2 = UIImage(named: "cx")!
    @State private var i3 = UIImage(named: "be")!
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text("Office No. 248")
                    .bold()
                    .foregroundColor(.white)
                Text("/ 3 patients")
                    .foregroundColor(Color(hex: 0xc2ddff))
            }
            HStack{
                Image(systemName: "clock")
                    .foregroundColor(.white)
                Text("8:30 AM - 2:00 PM")
                    .foregroundColor(Color(hex: 0xc2ddff))
            }
            HStack(){
                Image(uiImage: i1)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Image(uiImage: i2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Image(uiImage: i3)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
            }
            
        }
        .padding(.all)
        .frame(width: 260, height: 140)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.systemBlue),  Color(hex: 0x1b69c7)]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
    }
}

struct SearchBar: View{
    
    @Binding var searchText: String
    @Binding var issearching: Bool
    
    
    var body: some View{
        HStack{
            HStack{
                TextField("Search", text: $searchText)
                    .padding(.leading, 25)
                    .foregroundColor(.white)
            }.padding()
            .background(Color(hex: 0x7B9CD0, alpha: 0.3))
            .cornerRadius(18)
            .padding(.horizontal)
            .onTapGesture(perform: {
                issearching = true
            })
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if issearching{
                        Button(action: {searchText = ""}, label: {
                            Image(systemName: "xmark.circle.fill")
                        })
                    }
                }.padding(.horizontal, 32)
                .foregroundColor(.white)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if issearching{
                Button(action: {
                    issearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading,-12)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
        .padding(.leading, -10)
        .padding(.trailing, -10)
    }
}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
        .transition(.scale)
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName: String
    
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Spacer()
        }
        .padding(.horizontal, -1)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .blue : .gray)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
