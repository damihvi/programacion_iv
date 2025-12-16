// Arreglo de facturas con items
const facturas = [
    { 
        id: 1, 
        items: [
            { precio: 50.25, cantidad: 2 },
            { precio: 30.00, cantidad: 1 }
        ]
    },
    { 
        id: 2, 
        items: [
            { precio: 100.00, cantidad: 1 },
            { precio: 25.50, cantidad: 4 }
        ]
    },
    { 
        id: 3, 
        items: [
            { precio: 75.20, cantidad: 3 },
            { precio: 45.00, cantidad: 2 }
        ]
    },
    { 
        id: 4, 
        items: [
            { precio: 150.00, cantidad: 2 },
            { precio: 50.10, cantidad: 3 }
        ]
    }
];

function calcularTotalesPorFactura(facturas) {
    return facturas.map(factura => {
        const total = factura.items.reduce((suma, item) => {
            return suma + (item.precio * item.cantidad);
        }, 0);
        
        return {
            id: factura.id,
            total: total
        };
    });
}

const totales = calcularTotalesPorFactura(facturas);

console.log('\nArreglo con todos los totales:', totales);
