import SwiftUI

struct LastViewedButton: View
{
  @ObservedObject var flightInfo: FlightData
  @ObservedObject var appEnvironment: AppEnvironment
  @Binding var showNextFlight: Bool

  var body: some View
  {
    if
      let id = appEnvironment.lastFlightId,
      let lastFlight = flightInfo.getFlightById(id)
      {
      // swiftlint:disable multiple_closures_with_trailing_closure
      Button(action:
      {
        showNextFlight = true
      })
      {
        WelcomeButtonView(
          title: "Last Viewed Flight",
          subTitle: lastFlight.flightName,
          imageName: "suit.heart.fill"
        )
      }
      // swiftlint:enable multiple_closures_with_trailing_closure
    } else {
      Spacer()
    }
  }
}

struct LastViewedButton_Previews: PreviewProvider
{
  static var previews: some View
  {
    let environment = AppEnvironment()
    environment.lastFlightId = 1
    return LastViewedButton(flightInfo: FlightData(), appEnvironment: environment, showNextFlight: .constant(false))
  }
}
