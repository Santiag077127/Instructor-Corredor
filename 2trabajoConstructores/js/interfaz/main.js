const Perro = require("./Perro");
const Gato = require("./Gato");
const Loro = require("./Loro");
const AnimalCopia = require("./AnimalCopia");

console.log("=== PERRO ===");
let p = new Perro("Firulais");
p.hacerSonido();

console.log("\n=== GATO ===");
let g = new Gato("Misifú");
g.hacerSonido();

console.log("\n=== LORO ===");
let l = new Loro("Paco", "¡Hola humano!");
l.hacerSonido();

console.log("\n=== COPIA ===");
let copia = new AnimalCopia(p);
copia.hacerSonido();
