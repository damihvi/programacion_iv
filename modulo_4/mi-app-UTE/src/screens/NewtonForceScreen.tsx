import { useState } from "react";
import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";
import type { RootStackParamList } from "@/navigation/types";

type Props = NativeStackScreenProps<RootStackParamList, "NewtonForce">;

export function NewtonForceScreen({ navigation }: Props) {
  const [masa, setMasa] = useState<string>("");
  const [aceleracion, setAceleracion] = useState<string>("");
  const [fuerzaNewton, setFuerzaNewton] = useState<number | null>(null);
  const [fuerzaDinas, setFuerzaDinas] = useState<number | null>(null);

  const calcularFuerza = () => {
    const m = parseFloat(masa);
    const a = parseFloat(aceleracion);

    // F = m * a (en Newtons)
    const fNewton = m * a;
    // 1 Newton = 100,000 dinas
    const fDinas = fNewton * 100000;

    setFuerzaNewton(fNewton);
    setFuerzaDinas(fDinas);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>ejercicio Newton</Text>
      <Text style={styles.subtitle}>F = m × a</Text>

      <View style={styles.inputContainer}>
        <Text style={styles.label}>Masa (kg):</Text>
        <TextInput
          style={styles.input}
          value={masa}
          onChangeText={setMasa}
          keyboardType="numeric"
          placeholder="Ejemplo: 2.5"
          placeholderTextColor="#6e7681"
        />
      </View>

      <View style={styles.inputContainer}>
        <Text style={styles.label}>Aceleración (m/s²):</Text>
        <TextInput
          style={styles.input}
          value={aceleracion}
          onChangeText={setAceleracion}
          keyboardType="numeric"
          placeholder="Ejemplo: 1.2"
          placeholderTextColor="#6e7681"
        />
      </View>

      <Pressable style={styles.btnCalcular} onPress={calcularFuerza}>
        <Text style={styles.btnText}>Calcular</Text>
      </Pressable>

      {fuerzaNewton !== null && fuerzaDinas !== null && (
        <View style={styles.resultContainer}>
          <Text style={styles.resultTitle}>Resultados:</Text>
          
          <View style={styles.resultBox}>
            <Text style={styles.resultLabel}>Fuerza en Newtons:</Text>
            <Text style={styles.resultValue}>{fuerzaNewton.toFixed(4)} N</Text>
          </View>

          <View style={styles.resultBox}>
            <Text style={styles.resultLabel}>Fuerza en Dinas:</Text>
            <Text style={styles.resultValue}>{fuerzaDinas.toFixed(2)} dinas</Text>
          </View>
        </View>
      )}

      <Pressable style={styles.btnVolver} onPress={() => navigation.goBack()}>
        <Text style={styles.btnText}>Volver</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 24,
    marginBottom: 6,
    textAlign: "center",
  },
  subtitle: {
    color: "#c9d1d9",
    fontSize: 18,
    marginBottom: 24,
    textAlign: "center",
    opacity: 0.9,
  },
  inputContainer: {
    marginBottom: 16,
  },
  label: {
    color: "#c9d1d9",
    fontWeight: "700",
    fontSize: 16,
    marginBottom: 8,
  },
  input: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 8,
    paddingVertical: 12,
    paddingHorizontal: 14,
    color: "#c9d1d9",
    fontSize: 16,
  },
  buttonRow: {
    flexDirection: "row",
    gap: 12,
    marginTop: 8,
    marginBottom: 24,
  },
  btnCalcular: {
    backgroundColor: "#238636",
    borderRadius: 8,
    paddingVertical: 8,
    paddingHorizontal: 24,
    alignItems: "center",
    alignSelf: "center",
  },
  btnLimpiar: {
    flex: 1,
    backgroundColor: "#21262d",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: "center",
  },
  btnText: {
    color: "#c9d1d9",
    fontWeight: "800",
    fontSize: 16,
  },
  resultContainer: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    padding: 16,
    marginBottom: 20,
  },
  resultTitle: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 16,
  },
  resultBox: {
    marginBottom: 12,
  },
  resultLabel: {
    color: "#c9d1d9",
    fontSize: 14,
    opacity: 0.8,
    marginBottom: 4,
  },
  resultValue: {
    color: "#58a6ff",
    fontSize: 20,
    fontWeight: "900",
  },
  infoBox: {
    backgroundColor: "#1f6feb22",
    borderColor: "#1f6feb",
    borderWidth: 1,
    borderRadius: 6,
    padding: 12,
    marginTop: 12,
  },
  infoText: {
    color: "#58a6ff",
    fontSize: 14,
    fontWeight: "600",
  },
  btnVolver: {
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: "center",
    marginTop: "auto",
  },
});
