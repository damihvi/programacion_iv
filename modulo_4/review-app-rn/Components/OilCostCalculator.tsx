import { useState } from 'react';
import { View, Text, TextInput } from "react-native";

export default function OilCostCalculator() {
    const [liters, setLiters] = useState(0);
    const [price, setPrice] = useState(0);

    const total = price * liters;
    return (
      <View style={{padding: 16,borderWidth: 1,borderRadius: 8,marginBottom: 14}}>
        <Text>
          Costo de aceite
        </Text>
        <TextInput
            keyboardType="numeric"
            placeholder="Litros "
            onChangeText={(v: string) => setLiters(Number(v) || 0)}
            style={{
                borderWidth: 1,
                padding: 10,
                marginTop: 10
            }}
      />
      <TextInput
            keyboardType="numeric"
            placeholder="Precio"
            onChangeText={(v: string) => setPrice(Number(v) || 0)}
            style={{
                borderWidth: 1,
                padding: 10,
                marginTop: 10
            }}
            />  
            <Text>
                Total: <Text style={{fontWeight:'700'}}>${total.toFixed(2)}</Text>
            </Text>
    </View>
  )
}