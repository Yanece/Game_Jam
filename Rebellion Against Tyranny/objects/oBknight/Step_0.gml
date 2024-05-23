
vspeed += 0.3; // Gravité constante

// Mouvements de va-et-vient
if (x > start_x + move_range || x < start_x - move_range) {
    move_direction *= -1; // Inverser la direction lorsque le bandit atteint la limite
}

hspeed = move_speed * move_direction;

// Animation
if (hspeed != 0) {
    sprite_index = (hspeed > 0) ? knightWALKright : knightWALKleft;
    image_xscale = sign(hspeed);
} else {
    sprite_index = (image_xscale > 0) ? knightIDLEright : knightIDLEleft;
}

// Collision Horizontale
if (place_meeting(x + hspeed, y, oSolid)) {
    hspeed = 0; // Arrêter le mouvement horizontal
}

x += hspeed;

// Collision Verticale (empêche de tomber dans le vide)
if (place_meeting(x, y + vspeed, oSolid)) {
    while (!place_meeting(x, y + sign(vspeed), oSolid)) {
        y += sign(vspeed);
    }
    vspeed = 0; // Remise à zéro de la vitesse verticale
}

y += vspeed;

// Collision avec le personnage principal
if (place_meeting(x, y, oPlayer)) {
    // Afficher le message demandant au joueur de rejoindre la cause ou de se battre
    if (!dialogue_shown) {
        var response = show_question("Rejoins notre cause ou je passe sur ton cadavre ?");
        if (response == true) {
            // Le joueur accepte de rejoindre
            // Ajoute ici le code pour que le bandit suive le joueur
        } else {
            // Le joueur refuse de rejoindre
            // Ajoute ici le code pour que le bandit commence à se battre
        }
        dialogue_shown = true; // Marquer le dialogue comme affiché
    }
}
