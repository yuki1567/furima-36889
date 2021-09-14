function itemPrice (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const priceVal = price.value;
    const priceTax = document.getElementById("add-tax-price");
    priceAfterTax = Math.floor(priceVal * 0.01);
    priceTax.innerHTML = `${priceAfterTax}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${priceVal - priceAfterTax}`; 
  });
};
window.addEventListener('load', itemPrice);