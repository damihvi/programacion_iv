export type Product = {
  id: string;
  name: string;
  price: number;
  marca: string;
  descripcion: string;
};

export const PRODUCTS: Product[] = [
  { id: "p1", name: "Mouse", price: 12, marca: "Logitech", descripcion: "Mouse inalámbrico ergonómico" },
  { id: "p2", name: "Keyboard", price: 25, marca: "Redragon", descripcion: "Teclado mecánico RGB" },
  { id: "p3", name: "Monitor", price: 180, marca: "Samsung", descripcion: "Monitor 24 pulgadas Full HD" },
  { id: "p4", name: "Laptop Stand", price: 30, marca: "Generic", descripcion: "Soporte ajustable para laptop" },
  { id: "p5", name: "Headset", price: 45, marca: "HyperX", descripcion: "Auriculares gaming con micrófono" },
];