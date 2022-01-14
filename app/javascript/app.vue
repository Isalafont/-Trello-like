<template>
  <div class="list-wrapper">
    <draggable
      v-model="lists"
      v-bind="{ group: 'lists' }"
      class="dragArea d-inline-block"
      @end="listMoved"
    >
      <list v-for="(list, index) in lists" :key="list.id" :list="list"></list>
    </draggable>

    <div class="list">
      <a v-if="!editing" v-on:click="startEditing">Add a list</a>
      <textarea
        v-if="editing"
        ref="message"
        v-model="message"
        class="form-control mb-1"
      ></textarea>
      <button v-if="editing" v-on:click="createList" class="btn btn-primary">
        Add
      </button>
      <a v-if="editing" v-on:click="editing = false">Cancel</a>
    </div>
  </div>
</template>

<script>
import Rails from '@rails/ujs'
import draggable from 'vuedraggable'
import list from 'components/list'

export default {
  components: { draggable, list },

  data: function () {
    return {
      editing: false,
      message: '',
    }
  },

  computed: {
    lists: {
      get() {
        return this.$store.state.lists
      },
      set(value) {
        this.$store.state.lists = value
      },
    },
  },

  methods: {
    startEditing: function () {
      this.editing = true
      this.$nextTick(() => {
        this.$refs.message.focus()
      })
    },

    listMoved: function (event) {
      var data = new FormData()
      data.append('list[position]', event.newIndex + 1)

      Rails.ajax({
        beforeSend: () => true,
        url: `/lists/${this.lists[event.newIndex].id}/move`,
        type: 'PATCH',
        data: data,
        dataType: 'json',
      })
    },

    createList: function () {
      var data = new FormData()
      data.append('list[name]', this.message)

      Rails.ajax({
        beforeSend: () => true,
        url: '/lists',
        type: 'POST',
        data: data,
        dataType: 'json',
        success: (data) => {
          this.message = ''
          this.editing = false
        },
      })
    },
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
/* Min-height for empty column */
.dragArea {
  min-height: 10px;
}

.list-wrapper {
  box-sizing: border-box;
  height: 100%;
  margin: 0 4px;
  overflow-x: scroll;
  overflow-y: hidden;
  white-space: nowrap;
  -webkit-overflow-scrolling: touch;
}

.list-wrapper:first-child {
  margin-left: 12px;
}

.list {
  background: #e2e4e6;
  border-radius: 3px;
  display: inline-block;
  height: 100%;
  margin: 10px 10px;
  padding: 10px;
  vertical-align: top;
  width: 272px;
}
</style>
