const superHeroName = document.getElementById("super_hero_name");
const superHeroPower = document.getElementById("super_hero_power_ids");
const superHeroPowerTwo = document.getElementById("super_hero_power_ids_2");
const superHeroAddress = document.getElementById("auto_address");
const superHeroPrice = document.getElementById("super_hero_price");
const superHeroPhoto = document.getElementById("super_hero_photo");

const superHeroNameCard = document.getElementById("super_hero_name_card");
const superHeroAddressCard = document.getElementById("super_hero_address_card");
const superHeroPowerCard = document.getElementById("super_hero_power_card");
const superHeroPriceCard = document.getElementById("super_hero_price_card");

superHeroName.addEventListener('keyup', (event) => {
  superHeroNameCard.innerText = superHeroName.value;
});

superHeroAddress.addEventListener('keyup', (event) => {
  superHeroAddressCard.innerText = superHeroAddress.value;
});

superHeroPrice.addEventListener('click', (event) => {
  superHeroPriceCard.innerText = superHeroPrice.value;
});

superHeroPower.addEventListener('click', (event) => {
  super_hero_power_card.insertAdjacentHTML('beforeend', `<li>${superHeroPower.options[superHeroPower.selectedIndex].text}</li>`);
});

superHeroPowerTwo.addEventListener('click', (event) => {
  super_hero_power_card.insertAdjacentHTML('beforeend', `<li>${superHeroPowerTwo.options[superHeroPowerTwo.selectedIndex].text}</li>`);
});

function readURL(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      document.querySelector('#super_hero_img').src = e.target.result
    }
    reader.readAsDataURL(input.files[0]);
  }
};

superHeroPhoto.addEventListener('change', function() {
  readURL(this);
})
