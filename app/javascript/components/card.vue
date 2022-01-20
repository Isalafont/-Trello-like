<template>
  <div>
    <div @click="editing = true" class="card card-body text-wrap mb-3">
      <h5 class="card-title">{{ card.title }}</h5>
      <p class="card-text text-wrap mb-5">{{ card.content }}</p>
    </div>

    <!-- Modal Editing card -->
    <div v-if="editing" class="modal-backdrop show"></div>

    <div
      v-if="editing"
      @click="closeModal"
      class="modal show"
      style="display: block;"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <div class="modal-title">
              <input v-model="title" id="editor" class="form-control"> </input>
            </div>
          </div>
          <div class="modal-body">
            <h6 class="model-body">Description</h6>
            <input v-model="content" id="editor" class="form-control"> </input>
          </div>
          <div class="modal-footer">
            <button @click="save" type="button" class="btn btn-primary">
              Save changes
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Modal -->
  </div>
</template>

<script>
import Rails from '@rails/ujs'

export default {
  props: ['card', 'list'],
  data: function () {
    return {
      editing: false,
      title: this.card.title,
      content: this.card.content
    }
  },

  methods: {
    // Clicking backdrop will close modal
    closeModal: function (event) {
      if (event.target.classList.contains('modal')) {
        this.editing = false
      }
    },

    save: function () {
      var data = new FormData()
      data.append('card[title]', this.title),
      data.append('card[content]', this.content)

      Rails.ajax({
        beforeSend: () => true,
        url: `/cards/${this.card.id}`,
        type: 'PATCH',
        data: data,
        dataType: 'json',
        success: (data) => {
          this.editing = false
        },
      })
    },
  },
}
</script>

<style scoped>
</style>
