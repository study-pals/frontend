import type { JSX } from 'react';
import React from 'react';
import {
  StyleSheet,
  Text,
  useColorScheme,
  View,
} from 'react-native';
import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';

const App = (): JSX.Element => (
  <View style={styles.container}>
    <Text style={styles.title}>Hello World!</Text>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    color: Colors.white,
    fontSize: 24,
    fontWeight: '600',
  },
});

export default App;
