// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports

import Vue from "vue/dist/vue.esm";
import Vuex from "vuex";
import App from "../app.vue";
import TurbolinksAdapter from 'vue-turbolinks';


Vue.use(Vuex)
Vue.use(TurbolinksAdapter)

window.store = new Vuex.Store({
  state: {
    lists: []
  },

  mutations: {
    addList(state, data) {
      state.lists.push(data)
    },
    moveList(state, data) {
      const index = state.lists.findIndex(item => item.id == data.id)
      state.lists.splice(index, 1)
      state.lists.splice(data.position - 1, 0, data)
    },
    addCard(state, data) {
      const index = state.lists.findIndex(item => item.id == data.list_id)
      state.lists[index].cards.push(data)
    },
    editCard(state, data) {
      const list_index = state.lists.findIndex((item) => item.id == data.list_id)
      const card_index = state.lists[list_index].cards.findIndex((item) => item.id == data.id)
      state.lists[list_index].cards.splice(card_index, 1, data)
    },
  },
});

document.addEventListener('turbolinks:load', () => {
  var element = document.querySelector("#boards")
  if (element != undefined) {
    window.store.state.lists = JSON.parse(element.dataset.lists)

    const app = new Vue({
      el: element,
      store: window.store,
      template: "<App />",
      components: { App }
    })
  }
});
