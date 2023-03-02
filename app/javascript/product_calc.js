const productCalc = () => {
  const price = document.getElementById("product_price")
  const fee = document.getElementById("tax_price")
  const sum = document.getElementById("profit")

  price.addEventListener("input",() => {
    fee.innerHTML = Math.floor(price.value * 0.1)
    sum.innerHTML = Math.floor(price.value * 0.9)
  });
};
if(document.URL.match(/products\/new/)){
window.addEventListener('load', productCalc);
};