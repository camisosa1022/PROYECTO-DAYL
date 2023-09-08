//variables del carrito
const carrito = document.getElementById("carrito"),
        listacursos = document.getElementById("listacursos"),
        contenedorcarrrito = document.querySelector('.buy-card .lista_de_curso'),
        vaciarcarritobtn = document.querySelector('#vaciar_carrito'),
        milocalstorage = window.localStorage;

let artuculoscarrito =[];
cargarcarritolocal()
carritohtml()
registrarEventsListeners()


//funciones del carrito

function registrarEventsListeners() {
    
    //cuando yo le de click a "agregar carrito"
    listacursos.addEventListener('click', agregar)

    //eliminar curso del carrito

    carrito.addEventListener('click', eliminar);

    //vaciar el carrito

    vaciarcarritobtn.addEventListener('click', e =>{
       artuculoscarrito = [];
        limpiarhtml()
     })
     
}

function agregar(e){ 
    e.preventDefault();
    if(e.target.classList.contains("agregar-carrito")){
        const cursoselecionado = e.target.parentElement.parentElement;
        
        leerinfo(cursoselecionado)
    }
    console.log(leerinfo)
}

//elimina articulo del producto
function eliminar(e){
    if(e.target.classList.contains("borrar")){
        const cursoid = e.target.getAttribute('data-id');

        //eliminnar del arreglos del articulo carrito por data-id

        artuculoscarrito = artuculoscarrito.filter(curso => curso.id !== cursoid)

        carritohtml()
    }
}


//leer el contenido de nuestro html al que le dimos click y estrae la informacion
function leerinfo(curso) {
    //crear un objeto con el contenido del curso actual

    const infocurso = {
        imagen : curso.querySelector('img').src,
        titulo: curso.querySelector('h3').textContent,
        descrip: curso.querySelector('p').textContent,
        precio: curso.querySelector('h6').textContent,
        id : curso.querySelector('button').getAttribute('data-id'),
        cantidad : 1
    }

    //Revisa si un elemento ya existe en el carrito
    const existe = artuculoscarrito.some(curso => curso.id === infocurso.id)

    if(existe){
        //actualizar la cantidad
        const cursos = artuculoscarrito.map(curso => { 
            if(curso.id === infocurso.id){
                curso.cantidad++;
                return curso
            }else{
                return curso;
            }
        });
        [...artuculoscarrito,infocurso]
    }else{
        //agregamos elementos al carrito de compra

        artuculoscarrito = [...artuculoscarrito,infocurso];
    }
    
    guardarcarritolocal()
}

//muestra en el carrito html
function carritohtml(){
    //recorre el carrito de compras y genera el html
    limpiarhtml()
    artuculoscarrito.forEach(curso => {
        const fila = document.createElement('div');
        fila.innerHTML = `
        <img src="${curso.imagen}"></img>
        <p>${curso.titulo}<br>
        ${curso.cantidad} x ${curso.precio}  
        <button class="circular ui icon button">
            <i class="trash alternate icon"><span class="borrar" data-id="${curso.id}"></span></i>
        </button></p>
        `;
        contenedorcarrrito.appendChild(fila);
    });
    
    
}

//elimina los cursos de la lista de cursos

function limpiarhtml(){
    while(contenedorcarrrito.firstChild){
        contenedorcarrrito.removeChild(contenedorcarrrito.firstChild)
    }
    guardarcarritolocal()
}

function guardarcarritolocal(){
    milocalstorage.setItem('lista_de_curso', JSON.stringify(artuculoscarrito));
}

function cargarcarritolocal(){
    if(milocalstorage.getItem('lista_de_curso')!==null){
        artuculoscarrito = JSON.parse(milocalstorage.getItem('lista_de_curso'));
    }
    
}

