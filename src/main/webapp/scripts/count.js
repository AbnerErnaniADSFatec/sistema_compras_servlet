var table = document.getElementById('products');
var codes = [];
for (var row = 1, range = table.rows.length; row < range; row++) {
    codes.push(table.rows[row].cells[0].innerHTML);
}
var inc = (
    function(){
        return function(){
            var valorTotal = 0
            for (var i = 0, range = codes.length; i < range; i++) {
                if (!isNaN(parseFloat(document.getElementById('valor-' + codes[i]).textContent)) && !isNaN(parseFloat(document.getElementById('quant-' + codes[i]).value))) {
                    valorTotal = 
                        valorTotal + (
                            parseFloat(document.getElementById('valor-' + codes[i]).textContent) * 
                            parseFloat(document.getElementById('quant-' + codes[i]).value)
                        );
                }
            }
            return valorTotal;
        };
    }()
);
window.onload = function() {
    for (var i = 0, range = codes.length; i < range; i++) {
        input = document.getElementById('quant-' + codes[i]);
        input.onchange = async function (){
            valor = inc();
            if (valor === 0) {
                document.getElementById("valorTotal").style.color = 'red';
            } else {
                document.getElementById("valorTotal").style.color = 'green';
            }
            document.getElementById('valorTotal').textContent = valor.toFixed(2.5).toString();
        };
    }
};