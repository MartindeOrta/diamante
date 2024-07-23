// SPDX-License-Identifier: MIT


pragma solidity >0.7 <0.9;


//import “./jds.sol”;
contract EjemploEstructurasContract {
enum Estados { EstadoUno, EstadoDos, EstadoTres, EstadoN }
Estados public state = Estados.EstadoN;
struct Usuario {
string nombre;
uint edad;
address wallet;
}
Usuario public miUsuario;

function functionQueRetornaTuplaDosValores() public pure returns(string memory,uint) {
return ('un valor de texto', 1012);
}
function functionQueRetornaTuplaDosstring() public pure returns(string memory,string memory) {
return ('un valor de texto', 'otro valor');
}
}