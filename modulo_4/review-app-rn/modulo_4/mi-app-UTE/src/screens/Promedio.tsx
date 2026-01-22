import { useState } from "react";
import { StyleSheet, Text, TextInput, View } from "react-native";
import { Double } from "react-native/Libraries/Types/CodegenTypes";

type LoginForm = {
  nota1: string;
  nota2: string;
  nota3: string;
};

export function Promedio() {
  const [form, setForm] = useState<LoginForm>({ nota1: "", nota2: "", nota3: "" });
  const resultado = (parseFloat(form.nota1) + parseFloat(form.nota2) + parseFloat(form.nota3))/3;
  return (
    <View style={styles.container}>
      <Text style={styles.label}>Nota 1</Text>
      <TextInput
        value={form.nota1}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota1: text }))}
        style={styles.input}
        placeholderTextColor="#8b949e"
      />

      <Text style={styles.label}>Nota 2</Text>
      <TextInput
        value={form.nota2}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota2: text }))}
        style={styles.input}
        placeholderTextColor="#8b949e"
      />

      <Text style={styles.label}>Nota 3</Text>
      <TextInput
        value={form.nota3}
        onChangeText={(text) => setForm((prev) => ({ ...prev, nota3: text }))}
        style={styles.input}
        placeholderTextColor="#8b949e"
      />

      <View style={styles.preview}>
        <Text style={styles.previewText}>Promedio: {(resultado) || "(vacío)"}</Text>
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
  },
  preview: {
    marginTop: 8,
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    padding: 12,
  },
  previewTitle: {
    color: "#58a6ff",
    fontWeight: "800",
    marginBottom: 6,
  },
  previewText: {
    color: "#c9d1d9",
    opacity: 0.9,
    lineHeight: 20,
  },
});