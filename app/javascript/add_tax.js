window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    fee = Math.floor(inputValue * 0.1 );
    addTaxDom.innerHTML = fee.toLocaleString();
    const addProDom = document.getElementById("profit");
    pfnum = inputValue - Math.floor(inputValue * 0.1);
    addProDom.innerHTML = pfnum.toLocaleString();

  })
  
});