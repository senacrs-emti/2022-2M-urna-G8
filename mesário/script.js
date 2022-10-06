function tela(eleitor){
    document.getElementById('telaletra2').value(eleitor);
}

function botao(valor){
    eleitor = document.getElementById('dados').val;
    eleitor = eleitor+valor;
    document.getElementById('dados').value(eleitor);
    tela(eleitor);
}