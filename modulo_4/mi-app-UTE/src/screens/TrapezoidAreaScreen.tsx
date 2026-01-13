import { useMemo, useState } from "react";
import {
  Alert,
  KeyboardAvoidingView,
  Platform,
  Pressable,
  StyleSheet,
  Text,
  TextInput,
  View,
} from "react-native";

type TrapezoidForm = {
  baseMayor: string;
  baseMenor: string;
  altura: string;
};

type TrapezoidErrors = Partial<Record<keyof TrapezoidForm, string>>;

export function TrapezoidAreaScreen() {
  const [form, setForm] = useState<TrapezoidForm>({ 
    baseMayor: "", 
    baseMenor: "", 
    altura: "" 
  });
  const [errors, setErrors] = useState<TrapezoidErrors>({});
  const [submitted, setSubmitted] = useState<boolean>(false);
  const [result, setResult] = useState<number | null>(null);

  const bg = "#0d1117";
  const card = "#161b22";
  const border = "#30363d";
  const text = "#c9d1d9";
  const primary = "#58a6ff";
  const danger = "#f85149";
  const success = "#3fb950";

  function validate(next: TrapezoidForm): TrapezoidErrors {
    const e: TrapezoidErrors = {};

    const bMayor = parseFloat(next.baseMayor);
    const bMenor = parseFloat(next.baseMenor);
    const alt = parseFloat(next.altura);

    if (!next.baseMayor || isNaN(bMayor) || bMayor <= 0) {
      e.baseMayor = "Debe ser un número mayor a 0";
    }
    if (!next.baseMenor || isNaN(bMenor) || bMenor <= 0) {
      e.baseMenor = "Debe ser un número mayor a 0";
    }
    if (!next.altura || isNaN(alt) || alt <= 0) {
      e.altura = "Debe ser un número mayor a 0";
    }

    return e;
  }

  const isOk = useMemo(() => {
    const e = validate(form);
    return Object.keys(e).length === 0;
  }, [form]);

  function onChange<K extends keyof TrapezoidForm>(key: K, value: TrapezoidForm[K]) {
    setForm((prev) => ({ ...prev, [key]: value }));
    if (submitted) {
      setErrors(validate({ ...form, [key]: value } as TrapezoidForm));
    }
  }

  function clear() {
    setForm({ baseMayor: "", baseMenor: "", altura: "" });
    setErrors({});
    setSubmitted(false);
    setResult(null);
  }

  function calculate() {
    setSubmitted(true);
    const e = validate(form);
    setErrors(e);

    if (Object.keys(e).length > 0) {
      setResult(null);
      return;
    }

    const bMayor = parseFloat(form.baseMayor);
    const bMenor = parseFloat(form.baseMenor);
    const altura = parseFloat(form.altura);


    const area = ((bMayor + bMenor) * altura) / 2;
    setResult(area);

  }

  return (
    <KeyboardAvoidingView
      style={{ flex: 1, backgroundColor: bg }}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
    >
      <View style={styles.container}>
        <Text style={[styles.title, { color: primary }]}>Área del Trapecio</Text>
        <Text style={[styles.subtitle, { color: text }]}>
          A = ((B + b) × h) / 2
        </Text>

        <View style={[styles.card, { backgroundColor: card, borderColor: border }]}>
          <Text style={[styles.label, { color: text }]}>Base Mayor (B)</Text>
          <TextInput
            value={form.baseMayor}
            onChangeText={(t) => onChange("baseMayor", t)}
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { 
                backgroundColor: card, 
                borderColor: errors.baseMayor ? danger : border, 
                color: text 
              },
            ]}
          />
          {errors.baseMayor ? (
            <Text style={[styles.error, { color: danger }]}>{errors.baseMayor}</Text>
          ) : null}

          <Text style={[styles.label, { color: text, marginTop: 10 }]}>Base Menor (b)</Text>
          <TextInput
            value={form.baseMenor}
            onChangeText={(t) => onChange("baseMenor", t)}
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { 
                backgroundColor: card, 
                borderColor: errors.baseMenor ? danger : border, 
                color: text 
              },
            ]}
          />
          {errors.baseMenor ? (
            <Text style={[styles.error, { color: danger }]}>{errors.baseMenor}</Text>
          ) : null}

          <Text style={[styles.label, { color: text, marginTop: 10 }]}>Altura (h)</Text>
          <TextInput
            value={form.altura}
            onChangeText={(t) => onChange("altura", t)}
            placeholderTextColor="#8b949e"
            keyboardType="numeric"
            style={[
              styles.input,
              { 
                backgroundColor: card, 
                borderColor: errors.altura ? danger : border, 
                color: text 
              },
            ]}
          />
          {errors.altura ? (
            <Text style={[styles.error, { color: danger }]}>{errors.altura}</Text>
          ) : null}

          {result !== null && (
            <View style={[styles.resultBox, { backgroundColor: "#162d21", borderColor: success }]}>
              <Text style={[styles.resultLabel, { color: success }]}>Área calculada:</Text>
              <Text style={[styles.resultValue, { color: success }]}>
                {result.toFixed(2)} unidades²
              </Text>
            </View>
          )}

          <Pressable
            style={[
              styles.btn,
              { borderColor: primary, opacity: isOk ? 1 : 0.6 },
            ]}
            onPress={calculate}
          >
            <Text style={[styles.btnText, { color: primary }]}>Calcular Área</Text>
          </Pressable>



        </View>
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
    justifyContent: "center",
  },
  title: {
    fontWeight: "900",
    fontSize: 22,
    marginBottom: 6,
  },
  subtitle: {
    fontSize: 16,
    fontWeight: "700",
    marginBottom: 10,
    opacity: 0.9,
  },
  card: {
    borderWidth: 1,
    borderRadius: 12,
    padding: 14,
  },
  label: {
    fontWeight: "800",
    opacity: 0.9,
    marginBottom: 6,
  },
  input: {
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 12,
  },
  error: {
    marginTop: 6,
    fontWeight: "800",
  },
  resultBox: {
    marginTop: 14,
    borderWidth: 2,
    borderRadius: 10,
    padding: 12,
    alignItems: "center",
  },
  resultLabel: {
    fontWeight: "700",
    fontSize: 14,
    marginBottom: 4,
  },
  resultValue: {
    fontWeight: "900",
    fontSize: 24,
  },
  btn: {
    marginTop: 14,
    backgroundColor: "#21262d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnGhost: {
    marginTop: 10,
    backgroundColor: "transparent",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnText: {
    fontWeight: "900",
  },
  hint: {
    marginTop: 12,
    opacity: 0.85,
    lineHeight: 20,
  },
});
