**Create a new React Native project**
* In terminal, at whatever folder you want your project in:
   * _npx @react-native-community/cli@latest init HelloNative_
   * _cd HelloNative_

* Start the dev server (Metro)
   * _npx react-native start_
* Build & run on Android emulator
   * Open a new terminal window
   * Navigate to the same project directory as above
   * Build your project:
     * _npx react-native run-android_
   * **Note** - if the Emulator is open, the app should be built and launched.


**Installing Multiscreen Navigation Components**

In addition to your app initialization, you need to install navigation components
* npm install @react-navigation/native @react-navigation/native-stack
* npm install react-native-screens react-native-safe-area-context


**Folder Structure**

* IntroToReactMultiscreen/
    * screens/
        * HomeScreen.tsx
        * DetailsScreen.tsx
        * ProfileScreen.tsx
   * navigation/
      * types.ts
* App.tsx
