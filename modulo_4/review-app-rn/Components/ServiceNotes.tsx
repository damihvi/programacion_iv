import { useState } from "react";
import { View, TextInput, Text } from "react-native";

export default function ServiceNote(){
    const [note, setNote] = useState('');

    return (
        <View style = {{padding: 16 ,borderWidth:1, borderRadius: 8, marginBottom: 14}}>
            <Text>
                Nota de servicio
            </Text>
            <TextInput 
                placeholder="Ej: Cambio de aceite"
                value={note}
                onChangeText={setNote}
                style={{
                    borderWidth: 1,
                    padding: 10,
                    marginTop: 10,
                }}
            />
        </View>
    )
}