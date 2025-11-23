import React, { useEffect, useState } from "react";
import { View, Text, StyleSheet, ActivityIndicator, ScrollView, TouchableOpacity } from "react-native";
import { NativeStackScreenProps } from "@react-navigation/native-stack";
import { RootStackParamList } from "../navigation/AppNavigator";
import colors from "../theme/colors";

type Props = NativeStackScreenProps<RootStackParamList, "UserDetail">;

interface User {
  id: number;
  name: string;
  username: string;
  email: string;
  phone: string;
  website: string;
  address: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company: {
    name: string;
    catchPhrase: string;
  };
}

export default function UserDetailScreen({ route, navigation }: Props) {
  const { id } = route.params;
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`https://jsonplaceholder.typicode.com/users/${id}`)
      .then((response) => response.json())
      .then((data) => {
        setUser(data);
        setLoading(false);
      })
      .catch((error) => {
        console.error(error);
        setLoading(false);
      });
  }, [id]);

  if (loading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (!user) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>Error al cargar el usuario</Text>
      </View>
    );
  }

  return (
    <ScrollView style={styles.container}>
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Información Personal</Text>
        <View style={styles.card}>
          <Text style={styles.label}>Nombre</Text>
          <Text style={styles.value}>{user.name}</Text>
          
          <Text style={styles.label}>Usuario</Text>
          <Text style={styles.value}>@{user.username}</Text>
          
          <Text style={styles.label}>Email</Text>
          <Text style={styles.value}>{user.email}</Text>
          
          <Text style={styles.label}>Teléfono</Text>
          <Text style={styles.value}>{user.phone}</Text>
          
          <Text style={styles.label}>Sitio web</Text>
          <Text style={styles.value}>{user.website}</Text>
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Dirección</Text>
        <View style={styles.card}>
          <Text style={styles.value}>
            {user.address.street}, {user.address.suite}
          </Text>
          <Text style={styles.value}>
            {user.address.city}, {user.address.zipcode}
          </Text>
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Empresa</Text>
        <View style={styles.card}>
          <Text style={styles.label}>Nombre</Text>
          <Text style={styles.value}>{user.company.name}</Text>
          
          <Text style={styles.label}>Lema</Text>
          <Text style={styles.value}>{user.company.catchPhrase}</Text>
        </View>
      </View>

      <TouchableOpacity
        style={styles.button}
        onPress={() => navigation.navigate("Posts")}
      >
        <Text style={styles.buttonText}>Ver Posts</Text>
      </TouchableOpacity>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.background,
  },
  errorContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.background,
  },
  errorText: {
    color: colors.error,
    fontSize: 16,
  },
  section: {
    padding: 16,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: "bold",
    color: colors.primary,
    marginBottom: 12,
  },
  card: {
    backgroundColor: colors.card,
    padding: 16,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: colors.border,
  },
  label: {
    fontSize: 12,
    color: colors.secondary,
    marginTop: 12,
    marginBottom: 4,
  },
  value: {
    fontSize: 16,
    color: colors.text,
  },
  button: {
    backgroundColor: colors.primary,
    padding: 16,
    margin: 16,
    borderRadius: 8,
    alignItems: "center",
  },
  buttonText: {
    color: colors.background,
    fontSize: 16,
    fontWeight: "bold",
  },
});
