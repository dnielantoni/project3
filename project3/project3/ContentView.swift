//
//  ContentView.swift
//  project3
//
//  Created by User11 on 2022/11/14.
//
import SwiftUI
struct ContentView: View {
        var roles=["Japan","Maldives","France","Spain"]
        @State private var selectedName="First"
        @State private var selectedName2=0
        @State private var selectedIndex = 0
        @State private var scale: Array<CGFloat>=[10000,1000,1000,1000,1000]
        @State private var selectDate = Date()
        @State private var number = ""
        @State private var name = ""
        @State private var bgColor = Color.black
        @State private var changeColor = true
        @State private var gotoBrowser = false
        let roles2 = ["China Airlines", "Emirates", "Qatar Airways", "Eva Air"]
        var year: Int{
            Calendar.current.component(.year, from: selectDate)
        }
        var body: some View {
            NavigationView{
                GeometryReader{ geometry in
                    VStack(){
                        Image("Country\(selectedIndex)").resizable().padding().scaledToFill().frame(width: geometry.size.width, height: 300).clipped()
                        Form{
                               VStack{
                                Picker(selection: $selectedIndex, label: Text("Select")){
                                    ForEach(roles.indices){
                                        (index) in
                                        Text(roles[index])
                                    }
                                }.pickerStyle(SegmentedPickerStyle()).foregroundColor(bgColor)
                            }
                            HStack{
                                
                                Text("Price").foregroundColor(bgColor)
                                Slider(value: $scale[selectedIndex],in:10000...200000)
                                Text("\(scale[selectedIndex], specifier: "$%.2f")").foregroundColor(bgColor)
                                }
                            HStack{
                                Picker("Select Airlines",selection: self.$selectedName2){
                                                        ForEach(0..<roles2.count){(index) in
                                                            Text(self.roles2[index])}
                                }.foregroundColor(bgColor)
                            }
                            HStack{
                                DatePicker("Departure Date:", selection: $selectDate, in: Date()..., displayedComponents: .date).foregroundColor(bgColor)
                            }
                            HStack{
                                   Text("Name:").foregroundColor(bgColor)
                                   TextField("name", text: $name)
                                                }
                    
                            HStack{
                                   Text("Contact Number:").foregroundColor(bgColor)
                                   TextField("number", text: $number)
                            }
                        }
                            
                        Button(action: {
                            gotoBrowser=true
                              }) {
                            HStack {
                                    Image(systemName: "airplane")
                                    Text("Book Now")
                                    Image(systemName: "magnifyingglass")
                                 }
                        }.alert(isPresented: $gotoBrowser){() ->Alert in
                            let answer=["Book Success","Book Failed"].randomElement()!
                            return Alert(title: Text(answer))
                        }
                        .background(Color.yellow)
                        .cornerRadius(100)
                    }
                    }.navigationTitle("Travel Flights App")
                    
                }
            }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
