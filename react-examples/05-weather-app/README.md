## Create new project:

npx react-native@latest init ReactNativeWeatherWithMaps --template react-native-template-typescript
cd ReactNativeWeatherWithMaps


## Install maps:
npm i react-native-maps

## Get OpenWeatherMap API key


## Get Google Maps "Maps SDK for Android" API Key
* Go to Google Cloud Console → APIs & Services.
* Create a project (or use one).
* Enable: “Maps SDK for Android”.
* Create an API key. For now (to validate the setup), leave it unrestricted. You can restrict later to your package name + SHA-1.


### Put the key in your Android app

**File: android/app/src/main/AndroidManifest.xml**

Add this inside \<application\> (not inside \<activity\> and not outside \<application\>):

\<application
    android:name=".MainApplication"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher"
    android:roundIcon="@mipmap/ic_launcher_round"
    android:allowBackup="false"
    android:theme="@style/AppTheme"\>

    <!-- ADD THIS: -->
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="@string/google_maps_api_key" />

    <!-- existing activities/services below -->
    ...
</application>


File: android/app/src/main/res/values/strings.xml

Add your key:

<resources>
    <string name="app_name">RNWeatherBeginner</string>
    <string name="google_maps_api_key">YOUR_ANDROID_GOOGLE_MAPS_SDK_KEY</string>
</resources>


(Replace with the key you created.)

Alternative (env-based): in android/app/build.gradle you can set
manifestPlaceholders = [ googleMapsApiKey: YOUR_KEY ]
and then use ${googleMapsApiKey} in the manifest value. But the strings.xml approach above is simplest.
