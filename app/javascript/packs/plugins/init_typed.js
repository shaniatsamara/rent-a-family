import Typed from 'typed.js';

const initTyped = () => {
const checker = document.getElementById("family");
  if (checker) {
    const options = {
      strings: ['cool dad!', 'non-strict mom!', 'non-annoying sister!', 'fun brother!', 'fun but weird cousin!'],
      typeSpeed: 50,
      loop: true,
      smartBackspace: true
    };

    const typed = new Typed('#family', options);
  }
}

export { initTyped }
