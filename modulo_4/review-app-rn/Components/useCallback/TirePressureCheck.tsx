import { useCallback, useMemo, useState } from "react";
import { View, TextInput, Text, Button } from "react-native";

export default function TirePressureCheck(){
    const [currentPsi, setcurrentPsi] = useState(0);
    const [tire, setTire] = useState('delantera');
    const [needPsi, setNeedPsi] = useState(0);
    const IDEAL=32

    const calculate = useCallback(()=> {
        const missing = Math.max(0, IDEAL-currentPsi);
        setNeedPsi(missing);
    }, [currentPsi,tire])

    return (
        <View style = {{padding: 16 ,borderWidth:1, borderRadius: 8, marginBottom: 14}}>
            <Text>
                Presion de la llanta
            </Text>
            <TextInput
                placeholder="delantera/trasera"
                onChangeText={setTire}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
            <TextInput
                keyboardType="numeric"
                placeholder="Presión Actual"
                onChangeText={(v) => setcurrentPsi(Number(v) || 0)}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
            <View>
                <Button title="Calcular faltante" onPress={calculate}/>
            </View>
            <Text>
                PSI Faltante para {tire}: {" "}
                <Text style={{fontWeight: "700"}}>{needPsi || "..."}</Text>
            </Text>
        </View>
    )
}