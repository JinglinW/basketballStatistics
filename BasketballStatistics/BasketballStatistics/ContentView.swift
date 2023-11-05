import SwiftUI

struct ContentView: View {
    // Initializing variables that are necessary for calculating statistics
    @StateObject var basketballData = BasketballData()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Image("nba_pic")
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFit()
                            .frame(width: 400, height: 210)
                            .position(x:180, y:55)
                    }
                    
                    HStack {
                        Text("Bball Stats")
                            .font(.title)
                            .padding(.bottom, -3)
                            .bold()
                    }
                    
                    Group {
                        HStack {
                            Text("Enter Total Games Played:")
                            TextField("Total Games", value: $basketballData.totalGamesPlayed, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Games Won:")
                            TextField("Games Won", value: $basketballData.totalGamesWon, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Points Scored in Games:")
                            TextField("Total Points", value: $basketballData.totalPoints, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Rebounds in Games:")
                            TextField("Total Rebounds", value: $basketballData.totalRebounds, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Assists in Games:")
                            TextField("Total Assists", value: $basketballData.totalAssists, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Steals in Games:")
                            TextField("Total Steals", value: $basketballData.totalSteals, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Enter Total Blocks in Games:")
                            TextField("Total Blocks", value: $basketballData.totalBlocks, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .cornerRadius(20)
                        }
                        .padding(.bottom, 15)
                    }
                    
                    Button(action: calculateStatistics) {
                        Text("Calculate Statistics")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, -15)
                    Spacer()
                    NavigationLink(destination: ResultsView().environmentObject(basketballData)) {
                        Text("See results")
                    }
                    .padding(.all)
                }
            }
            .padding()
        }
    }
    
    func calculateStatistics() {
        let totalGamesPlayed = basketballData.totalGamesPlayed
        let totalGamesWon = basketballData.totalGamesWon
        let totalPoints = basketballData.totalPoints
        let totalRebounds = basketballData.totalRebounds
        let totalAssists = basketballData.totalAssists
        let totalSteals = basketballData.totalSteals
        let totalBlocks = basketballData.totalBlocks
        
        if totalGamesPlayed != 0 {
            let percentageGamesWon = ((totalGamesWon / totalGamesPlayed) * 100).rounded()
            let averagePoints = (totalPoints / totalGamesPlayed).rounded()
            let averageRebounds = (totalRebounds / totalGamesPlayed).rounded()
            let averageAssists = (totalAssists / totalGamesPlayed).rounded()
            let averageSteals = (totalSteals / totalGamesPlayed).rounded()
            let averageBlocks = (totalBlocks / totalGamesPlayed).rounded()
            
            basketballData.outputText =
                """
                Win Rate: \(percentageGamesWon)%
                Average Points: \(averagePoints)
                Average Rebounds: \(averageRebounds)
                Average Assists: \(averageAssists)
                Average Steals: \(averageSteals)
                Average Blocks: \(averageBlocks)
                """
        } else {
            basketballData.outputText = "Please enter the number of games played."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
