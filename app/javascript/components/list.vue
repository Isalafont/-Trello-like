<template>
  <div class="list">
    <h5>{{ list.name }}</h5>

    <draggable
      v-model="list.cards"
      v-bind="{ group: 'cards' }"
      class="dragArea"
      @change="cardMoved"
    >
      <card
        v-for="card in list.cards"
        :key="card.id"
        :card="card"
        :list="list"
      ></card>
    </draggable>

    <a v-if="!editing" v-on:click="startEditing">Add a card</a>
    <textarea
      v-if="editing"
      ref="message"
      v-model="message"
      class="form-control mb-1"
    ></textarea>
    <button v-if="editing" v-on:click="createCard" class="btn btn-primary">
      Add
    </button>
    <a v-if="editing" v-on:click="editing = false">Cancel</a>
  </div>
</template>

<script>
import Rails from '@rails/ujs'
import draggable from 'vuedraggable'
import card from 'components/card'

export default {
  components: { card, draggable },
  props: ['list'],

  data: function () {
    return {
      editing: false,
      message: '',
    }
  },

  methods: {
    startEditing: function () {
      this.editing = true
      this.$nextTick(() => {
        this.$refs.message.focus()
      })
    },

    cardMoved: function (event) {
      const evt = event.added || event.moved
      if (evt == undefined) {
        return
      }

      const element = evt.element
      const list_index = window.store.lists.findIndex((list) => {
        return list.cards.find((card) => {
          return card.id === element.id
        })
      })

      var data = new FormData()
      data.append('card[list_id]', window.store.lists[list_index].id)
      data.append('card[position]', evt.newIndex + 1)

      Rails.ajax({
        beforeSend: () => true,
        url: `cards/${element.id}/move`,
        type: 'PATCH',
        data: data,
        dataType: 'json',
      })
    },

    createCard: function () {
      var data = new FormData()
      data.append('card[list_id]', this.list.id)
      data.append('card[name]', this.message)

      Rails.ajax({
        beforeSend: () => true,
        url: '/cards',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: (data) => {
          this.message = ''
          this.$nextTick(() => {
            this.$refs.message.focus()
          })
        },
      })
    },
  },
}
</script>

<style scoped>
/* Min-height for empty column */
.dragArea {
  min-height: 15px;
}
</style>
