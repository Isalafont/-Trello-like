<template>
  <div>
    <div @click="editing=true" class="card card-body mb-3">
      {{ card.name }}
    </div>

    <!-- Modal Editing card -->
    <div v-if="editing" class="modal-backdrop show"></div>

    <div v-if="editing" @click="closeModal" class="modal show" style="display: block">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">{{ card.name }}</h5>
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
    <!-- End Modal -->
  </div>
</template>

<script>
  // import Rails from '@rails/ujs';

  export default {
    props: ['card', 'list'],
    data: function() {
      return {
        editing: false,
        name: this.card.name,
      }
    },

    methods: {
      // Clicking backdrop will close modal
      closeModal: function(event) {
        if (event.target.classList.contains("modal")) { this.editing = false }
      },

      save: function() {
        var data = new FormData
        data.append("card[name]", this.name)

        Rails.ajax({
          beforeSend: () => true,
          url: `/cards/${this.card.id}`,
          type: "PATCH",
          data: data,
          dataType: "json",
          success: (data) => {
            this.editing = false
          }
        })
      },
    }
  }
</script>

<style scoped>
</style>
