const userInput = document.getElementById("search-input");
const searchBtn = document.getElementById("search-button");

const pokemonName = document.getElementById("pokemon-name");
const pokemonId = document.getElementById("pokemon-id");
const pokemonWeight = document.getElementById("weight");
const pokemonHeight = document.getElementById("height");

const pokemonImage = document.getElementById("pokemon-image");
const pokemonTypes = document.getElementById("types");

const hp = document.getElementById("hp");
const attack = document.getElementById("attack");
const defense = document.getElementById("defense");
const specialAttack = document.getElementById("special-attack");
const specialDefense = document.getElementById("special-defense");
const speed = document.getElementById("speed");

const searchPokemon = async () => {

    try {
        const res = await fetch(`https://pokeapi-proxy.freecodecamp.rocks/api/pokemon/${userInput.value.toLowerCase()}`);
        const data = await res.json();
        const { name, id, weight, height, sprites, types, stats } = data;

        pokemonName.innerHTML = name.toUpperCase();
        pokemonId.innerHTML = `#${id}`;
        pokemonWeight.innerHTML = `Weight: ${weight}`;
        pokemonHeight.innerHTML = `Height: ${height}`;

        pokemonImage.innerHTML = `<img src="${sprites.front_default}" id="sprite" />`;
        pokemonTypes.innerHTML = types.map(types => `<span class="${types.type.name.toLowerCase()}">${types.type.name.toUpperCase()}</span>`)

        hp.innerHTML = stats[0].base_stat;
        attack.innerHTML = stats[1].base_stat;
        defense.innerHTML = stats[2].base_stat;
        specialAttack.innerHTML = stats[3].base_stat;
        specialDefense.innerHTML = stats[4].base_stat;
        speed.innerHTML = stats[5].base_stat;

    }
    catch (err) {
        console.log(err);
        alert("Pokémon not found")
    }
};

searchBtn.addEventListener("click", searchPokemon);

userInput.addEventListener("keydown", e => {
    if (e.key === "Enter") {
        searchPokemon;
    }
})