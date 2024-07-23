// SPDX-License-Identifier: MIT

pragma solidity >0.8.0 <0.9.0;

library espar{

    function ver(uint256  numero) public pure returns(bool){
        uint modulo = numero % 2;
        if (modulo == 0)
        { return true;
        }
        else{ return false;}
    }
//function sumarPorPolimofismo(address direccion, uint a, uint b) public returns(uint) {
// ICalculadora contrato = ICalculadora(direccion);
// return contrato.sumar(a,b);
// }

}