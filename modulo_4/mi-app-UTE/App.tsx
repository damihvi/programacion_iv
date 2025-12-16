import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { StateExample } from './src/screens/StateExample';
import { AppButton } from './src/components/AppButton';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mi app ute</Text>
      <Text style={styles.subtitle}>Entorno listo</Text>
      <Text style={styles.text}>Kevin Cóndor</Text>
      <StateExample/>
      <AppButton
        title="Presionar aquí"
        onPress={() => console.log('Botón presionado!')}
        variant="primary"
      />
      
      <View style={{ height: 10 }} />
      
      <AppButton
        title="Cargando..."
        onPress={() => {}}
        loading={true}
        variant="secondary"
      />
      
      <View style={{ height: 10 }} />
      
      <AppButton
        title="Deshabilitado"
        onPress={() => {}}
        disabled={true}
        variant="outline"
      />
      <StatusBar style="light" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#000000ff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: "600",
    color: 'yellow',
    marginBottom: 15
  },
  subtitle: {
    fontSize: 18,
    fontWeight: "600",
    marginBottom: 8,
    color: "#c9d1d9",
  },
  text: {
    fontSize: 12,
    fontWeight: "600",
    marginBottom: 8,
    color: "#c9d1d9",
  },
  light: {
    color: "red"
  }
});