<template>
  <div class="list">
    <div class="list-title">
      <h6>{{ list.name }}</h6>
      <i @click="editing=true" class="fas fa-ellipsis-h" id="editing-btn"></i>
      <!-- Editing Modal Editing List -->
      <div v-if="editing" class="modal-backdrop show"></div>

      <div v-if="editing" @click="closeModal" class="modal show" style="display: block">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Edit column name</h5>
            </div>
            <div class="modal-body">
              <input v-model="name" class="form-control"></input>
            </div>
            <div class="modal-footer">
              <button @click="save" type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- End Modal -->

    <draggable v-model="list.cards" v-bind="{group: 'cards'}" class="dragArea" @change="cardMoved">
      <card v-for="card in list.cards" :card="card" :list="list"></card>
    </draggable>

    <a v-if="!editing" v-on:click="startEditing">Add a card</a>
    <textarea v-if="editing" ref="message" v-model="message" class="form-control mb-1"></textarea>
    <button  v-if="editing" v-on:click="submitMessage" class="btn btn-primary">Add</button>
    <a v-if="editing" v-on:click="editing=false">Cancel</a>
  </div>
</template>

<script>

  import Rails from '@rails/ujs';
  import draggable from 'vuedraggable';
  import card from 'components/card';

  export default {
    components: { card, draggable },
    props: ["list"],
    data: function() {
      return {
        editing: false,
        name: this.list.name,
        message: ""
      }
    },
    methods: {
      // Clicking backdrop will close modal
      closeModal: function(event) {
        if (event.target.classList.contains("modal")) { this.editing = false }
      },
      // Save Modal Edit name
      save: function() {
        var data = new FormData
        data.append("list[name]", this.name)
        Rails.ajax({
          url: `/lists/${this.list.id}`,
          type: "PATCH",
          data: data,
          dataType: "json",
          success: (data) => {
            const list_index = window.store.lists.findIndex((item) => item.id == this.list.id)
            window.store.lists.splice(list_index, 1, data)
            this.editing = false
          }
        })
      },
      startEditing: function() {
        this.editing = true
        this.$nextTick(() => { this.$refs.message.focus() })
      },
      cardMoved: function(event){
        const evt = event.added || event.moved
        if (evt == undefined) { return }
        const element = evt.element
        const list_index = window.store.lists.findIndex((list) => {
          return list.cards.find((card) => {
            return card.id === element.id
          })
        })
        var data = new FormData
        data.append("card[list_id]", window.store.lists[list_index].id)
        data.append("card[position]", evt.newIndex + 1)
        Rails.ajax({
          url: `cards/${element.id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },
      submitMessage: function() {
        var data = new FormData
        data.append("card[list_id]", this.list.id)
        data.append("card[name]", this.message)
        Rails.ajax({
          url: "/cards",
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = window.store.lists.findIndex(item => item.id == this.list.id)
            window.store.lists[index].cards.push(data)
            this.message = ""
            this.$nextTick(() => { this.$refs.message.focus() })
          }
        })
      }
    }
  }
</script>

<style scoped>
/* Min-height for empty column */
  .dragArea {
    min-height: 15px;
  }
</style>
