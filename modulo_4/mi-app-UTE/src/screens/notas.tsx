import { useState } from "react";
import { StyleSheet, Text, TextInput, View } from "react-native";

type GradesForm = {
  nota1: string;
  nota2: string;
  nota3: string;
};

export function Nota() {
  const [form, setForm] = useState<GradesForm>({ nota1: "", nota2: "", nota3: "" });

  const calcularPromedio = (): number => {
    const n1 = parseFloat(form.nota1) || 0;
    const n2 = parseFloat(form.nota2) || 0;
    const n3 = parseFloat(form.nota3) || 0;
    return (n1 + n2 + n3) / 3;
  };

  const promedio = calcularPromedio();
  const estado = promedio >= 7 ? "Aprobado" : promedio > 0 ? "Reprobado" : "-";

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Calculadora de Promedio</Text>

      <Text style={styles.label}>Nota 1</Text>
      <TextInput
        value={form.nota1}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota1: text }))}
        style={styles.input}
        keyboardType="numeric"
        placeholder="0 - 10"
        placeholderTextColor="#8b949e"
      />

      <Text style={styles.label}>Nota 2</Text>
      <TextInput
        value={form.nota2}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota2: text }))}
        style={styles.input}
        keyboardType="numeric"
        placeholder="0 - 10"
        placeholderTextColor="#8b949e"
      />

      <Text style={styles.label}>Nota 3</Text>
      <TextInput
        value={form.nota3}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota3: text }))}
        style={styles.input}
        keyboardType="numeric"
        placeholder="0 - 10"
        placeholderTextColor="#8b949e"
      />

      <View style={styles.preview}>
        <Text style={styles.previewTitle}>Resultados</Text>
        <Text style={styles.previewText}>Nota 1: {form.nota1 || "0"}</Text>
        <Text style={styles.previewText}>Nota 2: {form.nota2 || "0"}</Text>
        <Text style={styles.previewText}>Nota 3: {form.nota3 || "0"}</Text>
        <View style={styles.divider} />
        <Text style={[styles.averageText, promedio >= 7 && styles.approved]}>
          Promedio: {promedio.toFixed(2)}
        </Text>
        <Text style={[styles.statusText, promedio >= 7 ? styles.approved : styles.failed]}>
          Estado: {estado}
        </Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
    justifyContent: "center",
  },
  title: {
    color: "#58a6ff",
    fontSize: 24,
    fontWeight: "900",
    marginBottom: 20,
    textAlign: "center",
  },
  label: {
    color: "#c9d1d9",
    marginBottom: 6,
    fontWeight: "700",
  },
  input: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 12,
    color: "#c9d1d9",
    marginBottom: 12,
    fontSize: 16,
  },
  preview: {
    marginTop: 16,
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    padding: 16,
  },
  previewTitle: {
    color: "#58a6ff",
    fontWeight: "800",
    marginBottom: 10,
    fontSize: 16,
  },
  previewText: {
    color: "#c9d1d9",
    opacity: 0.9,
    lineHeight: 24,
    fontSize: 14,
  },
  divider: {
    height: 1,
    backgroundColor: "#30363d",
    marginVertical: 12,
  },
  averageText: {
    color: "#c9d1d9",
    fontSize: 20,
    fontWeight: "800",
    marginBottom: 8,
  },
  statusText: {
    fontSize: 18,
    fontWeight: "700",
  },
  approved: {
    color: "#3fb950",
  },
  failed: {
    color: "#f85149",
  },
});
