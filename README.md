**CountriesApp**
iOS application that retrieves and displays a list of all countries in the world using the REST Countries API.

## Installation

Install my-CountriesApp via Terminal

```
git clone https://github.com/cgmajoor/CountriesApp.git
```
## External Libraries Used and How To Resolve Them
- PureLayout for layout
- Kingfisher for loading images from URL strings
- Lottie for loading and error animation
In Xcode -> File -> Packages -> Resolve Package Versions

**Screen captures**
![Goodflow-ezgif com-video-to-gif-converter](https://github.com/cgmajoor/CountriesApp/assets/10939149/0e8e0125-8677-419b-8e2b-f80e002ead76)
![Errorfetching-ezgif com-video-to-gif-converter](https://github.com/cgmajoor/CountriesApp/assets/10939149/b286168a-dd0e-4d84-9a49-19a704ff7a06)

**Original Requirements:**

1. The app should fetch country data from the REST Countries API (https://restcountries.com/).

2. Display a list of all countries on the main screen. Each list item should at least display the country name and its flag.

3. Tapping on a country should navigate the user to a detail screen where more information about the country is shown.

4. The detail screen should display additional information about the selected country, such as:
   - Country name
   - Capital
   - Population
   - Area
   - Region
   - Subregion
   - Borders (if any)
   - Languages spoken
   - Currency

5. Implement error handling for network requests and display appropriate error messages to the user if fetching data fails.

6. Implement loading indicators to indicate to the user when data is being fetched.

7. Utilize appropriate design patterns (e.g., MVC, MVVM) and architectural principles to structure the app's codebase.

8. Ensure the app's UI is visually appealing and follows iOS design guidelines.

9. Incorporate unit tests to ensure the stability and reliability of the app.

**Bonus:**

1. Implement search functionality to allow users to search for specific countries by name or capital city.

2. Add a feature to filter countries by region or subregion.

3. Implement caching mechanisms to store fetched data locally and improve app performance.

4. Provide at least two language translations of the app (e.g., English and Spanish).

**Note:**
Feel free to use any additional libraries or frameworks you deem necessary to accomplish the task efficiently. Make sure to document any dependencies and provide reasoning for their inclusion.
