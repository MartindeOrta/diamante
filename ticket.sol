// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 <0.9.0;
/*Contrato 1 de entradas:

1) Una estructura Person que contenga Id, Nombre y Cantidad.

2) Un Mapeao desde el address del dueño de la entrada apuntando a la estructura Person en que la variable se llame cliente.

3) Si el cliente adquiere más de 2 entradas adquiere una entrada de lotería que estará en otro contrato (contrato 2).

4) Si el owner del contrato quiere puede comprar entradas asignandoselas a distintas personas (en batch) pero no participarán del sorteo.

5) Permitir cambiar la primera letra del nombre de tu persona por mayuscula si está en minuscula.

6) Si una función que se llame en este contrato no existe deberá llamar al contrato de loteria y buscar la misma función (ej: ver el ganador de la lotería)
*/




//estructura dato que encapsula otros datos, la escructura no ocupa lugar
//las variables juntas para evitar gasto inesesario 

contract Ticket{
    struct Person{
       uint256 id;
        uint256 cantidad;
       string nombre;
      
    }
    uint256 public id;
    uint256 public constant price = 1*10**18;
    mapping(address => Person) public  cliente;
    address owner;
  

    function getLoteryTicket() public {

    }

  constructor() payable{
        owner = msg.sender;
    }

// tiene que verse desde otro contrato y payable para que pueda recibir 
    function comprarEntrada(string calldata _name) external payable{
        require(price <= msg.value, "no alcanza");//msg.value es la cantidad de eter enviar
        //msg es el mensaje que planta son lo unic
        uint256 _cantidad= msg.value/ price;// 11/10 = 1 
        uint256 _devolucion = msg.value % price; // se calcula el respto para devolveerle
        require(_devolucion<msg.value,"no te vamos a devolver mas");// menos de 32 caracateres apra que no sea un string largo
        cliente[msg.sender].id= id;
        cliente[msg.sender].nombre= _name; 
        cliente[msg.sender].cantidad= _cantidad;
        id++;
        if(_cantidad> 2 ){
            getLoteryTicket();
        }
        //hay que devolverle al usuario
        payable(msg.sender).transfer(_devolucion);
    }
    //4
    function asignEntrada(address[] calldata _addr, Person[] calldata amigos) external {
        require(msg.sender == owner,"usted no es el owner");
        uint256 _len = _addr.length;


        for (uint256 i; i<_len; i++){
            cliente[_addr[i]].cantidad= amigos[i].cantidad;
            cliente[_addr[i]].nombre= amigos[i].nombre;
            cliente[_addr[i]].id= id;
            id++;
        }


//5
    }
    function cambioLetra() external{
        




        bytes memory _nombre = bytes(cliente[msg.sender].nombre);
        bytes1 _letra =  _nombre[0];
        require(_letra > 0x60 , "ya es mayuscula");
        _letra =bytes1( uint8(_letra) + 0x20);
        bytes(cliente[msg.sender].nombre)[0]= _letra;




    }    
    //6 el fallback hay que definirlo para que entre a a la funcion que no encuentra
    // tenemos  que tener para esto tambien a receive 
    // MSG.data ppodemos acceder al celector.
    // con el data buscamos y buscamos 
    // 
    fallback() external payable{}
    receive() external payable{}



}