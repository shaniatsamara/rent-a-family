// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { initTyped } from "./plugins/init_typed";
import { initMapbox } from "./plugins/init_mapbox";
import { initSweetalert } from './plugins/init_sweetalert';



// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initTyped();
  initMapbox();
  initSweetalert('#sweet-alert-demo', {
    title: "Are you sure?",
    text: "This action cannot be reversed",
    icon: "warning",
    dangerMode: true,
    buttons: true
  }, (value) => {
    if (value) {
      const link = document.querySelector('#delete-link');
      swal("Poof! You deleted your family!", {
        icon: "success",
      }).then(() => {
        setTimeout(() => {
          link.click();
        }, 1000);
      });
    } else {
      swal("You didn't delete your family!");
    }
  });
});
