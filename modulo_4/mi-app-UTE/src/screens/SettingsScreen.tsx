import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";
import { useStoredState } from "@/hooks/useStoredState";

const KEY_DISPLAY_NAME = "@settings/displayName";

export function SettingsScreen() {
  const { value, setValue, loading, reset } = useStoredState<string>(KEY_DISPLAY_NAME, "");

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Settings</Text>

      {loading ? (
        <Text style={styles.text}>Cargando storage...</Text>
      ) : (
        <>
          <Text style={styles.label}>Nombre a guardar:</Text>
          <TextInput
            value={value}
            onChangeText={setValue}
            placeholder="Ej: Francisco"
            placeholderTextColor="#8b949e"
            style={styles.input}
            autoCapitalize="words"
          />

          <Text style={styles.preview}>Preview: {value || "(vacío)"}</Text>

          <Pressable style={styles.btn} onPress={reset}>
            <Text style={styles.btnText}>Reset (borrar)</Text>
          </Pressable>
        </>
      )}
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
    fontWeight: "900",
    fontSize: 20,
    marginBottom: 16,
  },
  text: {
    color: "#c9d1d9",
    fontWeight: "800",
  },
  label: {
    color: "#c9d1d9",
    opacity: 0.85,
    fontWeight: "800",
    marginBottom: 6,
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
    color: "#c9d1d9",
    fontWeight: "800",
    marginBottom: 12,
  },
  btn: {
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnText: {
    color: "#58a6ff",
    fontWeight: "900",
  },
});