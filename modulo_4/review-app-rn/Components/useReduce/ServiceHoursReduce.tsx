import { useCallback, useMemo, useReducer, useState } from "react";
import { View, TextInput, Text, Button } from "react-native";


type State ={
    hours: number;
}

type Action =
| {type: 'add_hour'}
| {type: 'remove_hour'};

const initialState: State = {
    hours: 0,
};

function reducer(state: State, action: Action){
    switch(action.type){
        case 'add_hour':
            return {hours: state.hours + 1};
        case 'remove_hour':
            return {hours: Math.max(0, state.hours - 1)};
    }
}

export default function ServiceHoursReduce(){
    const [state, dispatch] = useReducer(reducer, initialState);
    

    return (
        <View style = {{padding: 16 ,borderWidth:1, borderRadius: 8, marginBottom: 14}}>
            <Text>
                horas  de servicio
            </Text>
            <Text>
                horas  actuales
            </Text>
            
            <View>
                <Button title="+1 horas" onPress={() => dispatch({type: 'add_hour'})}/>
                <Button title="-1 horas" onPress={() => dispatch({type: 'remove_hour'})}/>
            </View>
        
        </View>
    )
}