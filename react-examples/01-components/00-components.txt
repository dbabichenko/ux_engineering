import React from 'react';
import {View, Text, Image, ScrollView, TextInput, StyleSheet} from 'react-native';

const App = () => {
  return (
    <ScrollView style={styles.screenContainer}>
      <Text style={styles.headerText}>Welcome to BusTracker</Text>
      <View>
        <Text>Search bus routes</Text>
        <Image
          source={require('./assets/bus.png')}
          style={{width: 370, height: 200}}
        />
      </View>
      <TextInput
        style={{
          height: 40,
          margin: 20,
          borderColor: 'gray',
          borderWidth: 1,
        }}
        defaultValue="Search"
      />
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  screenContainer: {
    padding: 20, // adds padding around the entire BusStop screen
    paddingTop: 100,
    backgroundColor: '#f8f9fa', // optional for contrast
  },
  busContainer: {
    marginBottom: 10, // spacing between buses
    padding: 10, // padding inside each Bus component
    backgroundColor: '#ffffff',
    borderRadius: 8,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowOffset: {width: 0, height: 2},
    shadowRadius: 4,
    elevation: 2, // Android shadow
  },
  headerText: {
      fontSize: 20,
      fontWeight: 'bold',
      },
});

export default App;