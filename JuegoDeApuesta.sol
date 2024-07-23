// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 <0.9.0;


contract JuegoDeApuestas{

    address[] public apostadores;
    address public owner;

    constructor() public {
        owner = msg.sender;
       
    }

    function apostar() external payable{
        // if(msg.value > 1 ether){
        // apostadores.push(msg.sender);}
        // else {
        //     //¿Qué hacemos acá?
        // }

        require (msg.value >= 1 ether,"valor inferior");
        apostadores.push(msg.sender);
    }
    function elegirGanador() public view miModificadordeFuncion{

    }

    function obntenerListaDeApostadores() public view returns(address[] memory){
        return apostadores;
    }

    modifier miModificadordeFuncion(){
        require(msg.sender == owner);
        _;
    }

}