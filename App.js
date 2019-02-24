import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Ionicons from 'react-native-vector-icons/FontAwesome';
import { createBottomTabNavigator, createAppContainer } from 'react-navigation';

class HomeScreen extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Home screen!</Text>
      </View>
    );
  }
}

class RecordScreen extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Record!</Text>
      </View>
    );
  }
}

class SettingsScreen extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Settings!</Text>
      </View>
    );
  }
}

const TabNavigator = createBottomTabNavigator({
  Home: HomeScreen,
  Record: RecordScreen,
  Settings: SettingsScreen,
}, {
  defaultNavigationOptions: ({ navigation }) => ({
    tabBarIcon: ({ focused, horizontal, tintColor }) => {
      const { routeName } = navigation.state;
      let IconComponent = Ionicons;
      let iconName;
      if (routeName === 'Home') {
        iconName = `home`;
      } else if (routeName === 'Record') {
        iconName = `microphone`;
      } else if (routeName === 'Settings') {
        iconName = `sliders`;
      }

      // You can return any component that you like here!
      return <IconComponent name={iconName} size={20} color={tintColor} />;
    },
  }),
  tabBarOptions: {
    activeTintColor: '#3b484a',
    inactiveTintColor: '#b6b4b4',
  },
});

export default createAppContainer(TabNavigator);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
