            
function ponerNota(input){

    let labelNota = document.getElementById('nota');
    let nota = parseFloat(input.value); 
    nota = nota/10;
    let contNota = document.getElementById('notaCont');
    labelNota.innerHTML = nota;
    if (nota < 4.5){                    
        contNota.style.backgroundImage = 'linear-gradient(0.35turn, red, var(--bs-gray-dark))';
    }
    else if (nota >= 4.5 && nota < 7.5){
        contNota.style.backgroundImage = 'linear-gradient(0.35turn, yellow, #B1B1B1)';
    }
    else if(nota >= 7.5 && nota < 9){
        contNota.style.backgroundImage = 'linear-gradient(0.35turn, green, #B1B1B1)';
    }
    else if(nota >= 9 && nota <=10){
        contNota.style.backgroundImage = 'var(--bs-grad-pst)';
    }
    else{
        contNota.style.backgroundImage = 'var(--bs-secondary)';
    }

}

function colorContNota(){
    const contsNotas = document.querySelectorAll('.notasConts');
    const notas = document.getElementsByClassName('notas');

    for(contNota of contsNotas){
        for(nota of notas){
            nota=parseFloat(nota.innerHTML);

            if (nota < 4.5){                    
                contNota.style.backgroundImage = 'linear-gradient(0.35turn, red, var(--bs-gray-dark))';
            }
            else if (nota >= 4.5 && nota < 7.5){
                contNota.style.backgroundImage = 'linear-gradient(0.35turn, yellow, #B1B1B1)';
            }
            else if(nota >= 7.5 && nota < 9){
                contNota.style.backgroundImage = 'linear-gradient(0.35turn, green, #B1B1B1)';
            }
            else if(nota >= 9 && nota <=10){
                contNota.style.backgroundImage = 'var(--bs-grad-pst)';
            }
            else{
                contNota.style.backgroundImage = 'var(--bs-secondary)';
            }
        }
    }

}



