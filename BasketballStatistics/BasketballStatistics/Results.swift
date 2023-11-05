import SwiftUI

struct ResultsView: View {
    // Initializing variables that are necessary for calculating statistics
    @EnvironmentObject var basketballData: BasketballData
    
    var body: some View {
        
        Text(basketballData.outputText)
            .font(.title2)
            .padding(.bottom, 45)
        
    }
    
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
