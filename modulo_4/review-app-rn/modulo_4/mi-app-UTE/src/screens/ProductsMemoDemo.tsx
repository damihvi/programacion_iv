import { useMemo, useState } from "react";
import { FlatList, StyleSheet, Text, TextInput, View } from "react-native";

type Product = {
  id: string;
  name: string;
  price: number;
  color: string;
};

const DATA: Product[] = [
  { id: "1", name: "Mouse", price: 12, color: "red" },
  { id: "2", name: "Keyboard", price: 25, color: "red" },
  { id: "3", name: "Monitor", price: 180, color: "Blue" },
  { id: "4", name: "Laptop Stand", price: 30, color: "Yellow" },
];

export function ProductsMemoDemo() {
  const [query, setQuery] = useState<string>("");
  const [minPrice, setMinPrice] = useState<number>(0);
  const [color, setColor] = useState<string>("");

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    const c = color.trim().toLocaleLowerCase();
    return DATA
      .filter((p) => (q ? p.name.toLowerCase().includes(q) : true))
      .filter((p) => p.price >= minPrice)
      .filter((p) => (c ? p.color.toLowerCase().includes(c) : true))
      .sort((a, b) => a.price - b.price);
  }, [query, minPrice, color]);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>useMemo: lista derivada</Text>

      <TextInput
        value={query}
        onChangeText={setQuery}
        placeholder="Buscar..."
        placeholderTextColor="#8b949e"
        style={styles.input}
      />

      <TextInput
        value={String(minPrice)}
        onChangeText={(t) => setMinPrice(Number(t || "0"))}
        placeholder="Precio mínimo..."
        placeholderTextColor="#8b949e"
        keyboardType="numeric"
        style={styles.input}
      />

      <TextInput
        value={color}
        onChangeText={setColor}
        placeholder="Color..."
        placeholderTextColor="#8b949e"
        style={styles.input}
      />

      <FlatList
        data={filtered}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.row}>
            <Text style={styles.name}>{item.name}</Text>
            <Text style={styles.price}>${item.price}</Text>
            <Text style={styles.price}>{item.color}</Text>
          </View>
        )}
      />
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
    fontSize: 16,
    marginBottom: 10,
  },
  input: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 12,
    color: "#c9d1d9",
    marginBottom: 10,
  },
  row: {
    paddingVertical: 10,
    borderBottomColor: "#30363d",
    borderBottomWidth: 1,
    flexDirection: "row",
    justifyContent: "space-between",
  },
  name: { color: "#c9d1d9", fontWeight: "700" },
  price: { color: "#58a6ff", fontWeight: "900" },
});