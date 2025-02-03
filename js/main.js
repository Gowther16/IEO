

//Dropdown Nav-main
// function toggleDropdown() {
//   const dropdown = document.querySelector('.dropdown-content');
//   dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
// }

//Slider
let list = document.querySelector('.slider .list');
let items = document.querySelectorAll('.slider .list .item');
let prev = document.getElementById('prev');
let next = document.getElementById('next');

let active = 0;
let lengthItems = items.length - 1;

//Move next item
next.onclick = function () {
  if (active + 1 > lengthItems) {
    active = 0; 
  } else {
    active = active + 1; 
  }
  reloadSlider();
}

//Move prev item
prev.onclick = function () {
  if (active - 1 < 0) {
    active = lengthItems; 
  } else {
    active = active - 1; 
  }
  reloadSlider();
}
let refreshSlider = setInterval(()=>{next.click()}, 5000);// Lặp mỗi 5s đổi slide
function reloadSlider() {
  let checkLeft = items[active].offsetLeft;
  list.style.left = -checkLeft + 'px';
  clearInterval(refreshSlider);
  let refreshSlider = setInterval(()=>{prev.click()}, 5000);

}


