import { StyleSheet, Text, View } from 'react-native';
import SaludoProps from "./src/components/SaludoProps";
import Contador from "./src/components/Contador";
import Saludo from "./src/components/Saludo";
import Caja from './src/components/Caja';

export default function App() {
  return (
    <View style={{ flex: 1, 
    justifyContent: "center", 
    alignItems: "center", 
    backgroundColor: "#0d1117" }}>
      <Saludo />
      <Text style={{color: "yellow"}}>
        los poderosos programadores de 4to semestre
      </Text>
      <SaludoProps nombre="Damian Herrera"/>
      <Contador />
      <Caja />
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
