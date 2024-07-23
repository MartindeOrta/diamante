// SPDX-License-Identifier: MIT

pragma solidity >0.8.0 <0.9.0;

contract Hello{
   // 24minutos
    string private saludo;//esto esta en la storage
    /*uint256
    uint128
    int64
    int32
    int16
    int8
    uint160=20 bytes
    address uint160*/ 

    //si se inicializa tiene un valor no existe la nulidad
    //cuando es public me genera un geter 
    //aca tenemos geter y seter
        //call data no puedo modificar
        //
//forma canonica 
//setSaludo(string)
//db070261 => selector de la funcion
//direccion smart contrac
//0xd9145CCE52D386f254917e481eB44e9943F39138
//0x3e55d43Ea9D7c792791a92bBB36Fc264431634B3
//las views gastan menos 
// tengo que ver donde coloco buen las funciones 
//porque va uno por uno comparando 
//hay que obtimisar y seguridad


// direccion del smart contract
    function setSaludo(string calldata _saludo) external{
        saludo = _saludo;
    }
//nada es secreto salamente no se puede usar 
/*
comentario varias lineas
*/
//forma canonica 
//getSaludo()
//keccak256 se le aplica a la forma canonica de la funcion
//b703ec59

    function getSaludo() external view returns(string memory){
       string memory _saludo;
       _saludo=saludo;
        //si escribimos un saludo un terrble codigo  lo podemos gastar 
        return(_saludo);//retornamos 
    }
}