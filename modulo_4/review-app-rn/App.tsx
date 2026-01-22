import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

import ServiceConstMemo from './Components/useMemo/ServiceCostMemo';
import FuelConsuptionMemo from './Components/useMemo/FuelConsumptionMemo';
import TirePressureCheck from './Components/useCallback/TirePressureCheck';


export default function App() {
  return (
    <View style={styles.container}>
      <ServiceConstMemo/>
      <FuelConsuptionMemo/>
      <TirePressureCheck/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});