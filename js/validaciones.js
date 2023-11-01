
//Se activa con onsubmit en el script registro.php
function validacion() {
    if (!camposBasicosVacios() && !camposGenYPlatVacios()) {
        return true;
    }
    else{
        return false;
    }

}



function camposBasicosVacios() {
    const inputsBasicos = document.getElementsByClassName('input');
    if(inputsBasicos !== undefined){
        for (input of inputsBasicos) {
            valor = input.value;
            if (valor == null || valor.length == 0) {
                const csub = document.createElement('sub');
                input.style.backgroundColor = 'var( --bs-orange)';
                csub.innerHTML = "Este campo no puede estar vacio";
                csub.setAttribute("class", "subPass");
                input.insertAdjacentElement("afterend", csub);
                return true;
            }

        }
    }
    return false;
}



//Se activa con onchange en el script registro.php
function comprobarRepPass(input) {
    console.log('Llamada');
    const input1 = document.getElementById('pass1');
    const input2 = document.getElementById('pass2');
    console.log(input1.value);
    console.log(input2.value);
    if (input1.value != "" && input2.value != "") {
        console.log('No estan vacios');
        if (input1.value === input2.value) {
            console.log('Son iguales');
            input1.style.backgroundColor = 'var( --bs-teal)';
            input2.style.backgroundColor = 'var( --bs-teal)';
            const sub = document.getElementsByClassName('subPass');
            if (sub !== undefined) {
                for (let elements of sub) {
                    elements.remove();
                }
            }
        } else {
            console.log('No son iguales');
            const csub = document.createElement('p');
            input.style.backgroundColor = 'var( --bs-orange)';
            csub.innerHTML = "La contraseña debe ser la misma en ambos campos";
            csub.setAttribute("class", "subPass");
            input.insertAdjacentElement("afterend", csub);
        }
    }
}

//Se activa con onchange en el script registro.php
function comprobarCorreo(input) {
    pattern = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
    if (!pattern.test(input.value)) {
        const csub = document.createElement('sub');
        input.style.backgroundColor = 'var( --bs-orange)';
        csub.innerHTML = "El formato de correo no es correcto";
        csub.setAttribute("class", "subPass")
        input.insertAdjacentElement("afterend", csub);
    } else {

        input.style.backgroundColor = 'white';
        const sub = document.getElementsByClassName('subPass');
        if (sub !== undefined) {

            for (elements of sub) {
                elements.remove();
            }
        }
    }
}

//Se activa con onsubmit en el script perfil.php
function camposGenYPlatVacios() {
    const arrayPlat = document.getElementsByClassName('inputPlat');
    const arrayGen = document.getElementsByClassName('inputGen');
    let notif;let tiempoMS = 2000;
    let platCheck = false;
    let genCheck = false;
    //const modificar = document.getElementById('modificar');
    for (plat of arrayPlat) {
        if (plat.checked) {
            platCheck = true;
            break;
        }
    }
    for (gen of arrayGen) {
        if (gen.checked) {
            genCheck = true;
            break;
        }
    }
    if(!platCheck){
        notif=document.getElementById('labelPlat');
        msj = "Al menos debes seleccionar una plataforma favorita";
        apareceNotifForm(notif, msj, tiempoMS);
    }
    if(!genCheck){
        notif=document.getElementById('labelGen');
        msj = "Al menos debes seleccionar un genero favorito";
        apareceNotifForm(notif, msj, tiempoMS) 
    }
    else if(platCheck && genCheck){
        return false;
        
    }

    return true;
    
}

function apareceNotifForm(input, msj, tiempoMS) {
    const sub = document.createElement('p');
    sub.style.color = 'var(--bs-warning)';
    sub.innerHTML = msj;
    input.appendChild(sub);
    setTimeout(() => {
        sub.style.display = "none";
    }, tiempoMS);
}

function enviar() {
    var formulario = document.getElementById("form");
    //Aqui tu codigo para mostrar tus objetos
    formulario.submit();
}
