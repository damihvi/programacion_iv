import { useMemo, useState } from "react";
import { View, TextInput, Text } from "react-native";

export default function ServiceConstMemo(){
    const [labor, setLabor] = useState(0);
    const [parts, setParts] = useState(0);
    const [serviceType, setServiceType] = useState('normal');

    const total = useMemo(()=> {
        const base = labor + parts;
        return serviceType.toLocaleLowerCase() === "urgente" ? base * 1.15 :base;
    }, [labor,parseInt,serviceType])

    return (
        <View style = {{padding: 16 ,borderWidth:1, borderRadius: 8, marginBottom: 14}}>
            <Text>
                Costo de Aceite
            </Text>
            <TextInput
                keyboardType="numeric"
                placeholder="Labor"
                onChangeText={(v) => setLabor(Number(v) || 0)}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
            <TextInput
                keyboardType="numeric"
                placeholder="Parte"
                onChangeText={(v) => setParts(Number(v) || 0)}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
            <TextInput
                keyboardType="numeric"
                placeholder="normal/urgente"
                onChangeText={setServiceType}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
            <Text>
                Total: <Text style={{fontWeight: "700"}}>{total.toFixed(2) || "..."}</Text>
            </Text>
        </View>
    )
}