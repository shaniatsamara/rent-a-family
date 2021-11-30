import Typed from 'typed.js';

const initTyped = () => {

  const options = {
    strings: ['cool dad!', 'non-strict mom!', 'non-annoying sister!', 'fun brother!', 'fun but wierd cousin!'],
    typeSpeed: 50,
    loop: true,
    smartBackspace: true
  };

  const typed = new Typed('#family', options);
}

export { initTyped }
