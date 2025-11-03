## Create new project:

npx @react-native-community/cli@latest init ReactNativeWeatherWithMaps

cd ReactNativeWeatherWithMaps


## Install maps:
npm i react-native-maps

## Get OpenWeatherMap API key
* Create an account
    * Go to https://openweathermap.org/register and click Sign up. 
    * Provide your email, choose a password, and submit.
    * Check your email and verify your address if required.
* Log in & access the dashboard
    * After verifying, log in at home.openweathermap.org
    * In your account area, find the section labelled API keys (often under “My API keys” or “API key” tab). 
* Generate or copy your API key
    * On the API keys page, your default key might already exist. You can use it or click Generate new key to create a fresh one.
    * Copy the key string (it will look like a random alphanumeric value).
    * __Important__: The key must be included in every API request you make, via the appid query parameter. 
* Select your plan & understand limits
    * By default, you’ll get access to the Free tier which allows a certain number of API calls per day. 
* Use the API key in your code
    * Example API call for current weather by city name: https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=YOUR_API_KEY
    * Replace YOUR_API_KEY with the key you obtained.
    * Tip: Use units=metric for Celsius, units=imperial for Fahrenheit.


## Get Google Maps "Maps SDK for Android" API Key
* Go to Google Cloud Console → APIs & Services.
* Create a project (or use one).
* Enable: “Maps SDK for Android”.
* Create an API key. For now (to validate the setup), leave it unrestricted. You can restrict later to your package name + SHA-1.


### Put the key in your Android app

**File: android/app/src/main/AndroidManifest.xml**

Add this inside \<application\> (not inside \<activity\> and not outside \<application\>):

\<application<br />
    android:name=".MainApplication"<br />
    android:label="@string/app_name"<br />
    android:icon="@mipmap/ic_launcher"<br />
    android:roundIcon="@mipmap/ic_launcher_round"<br />
    android:allowBackup="false"<br />
    android:theme="@style/AppTheme"\>

    <!-- ADD THIS: -->
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="@string/google_maps_api_key" />

    <!-- existing activities/services below -->
    ...
\</application\>


**File: android/app/src/main/res/values/strings.xml**

Add your key:

\<resources\>
    \<string name="app_name">ReactNativeWeatherWithMaps</string\>
    \<string name="google_maps_api_key">YOUR_ANDROID_GOOGLE_MAPS_SDK_KEY</string\>
\</resources\>

(Replace __YOUR_ANDROID_GOOGLE_MAPS_SDK_KEY__ with the key you created.)

