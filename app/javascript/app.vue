<template>
  <draggable :list="lists" v-bind="{group: 'lists'}" class="row dragArea" @end="listMoved">
    <div v-for="(list, index) in original_lists" class="col-3">
      <h6>{{ list.name }}</h6>
      <hr />

      <div v-for="(card, index) in list.cards" class="card card-body">
        {{ card.name }}
      </div>
      <div class="card card-body">
        <textarea v-model="messages[list.id]" class="form-control"></textarea>
        <button v-on:click="submitMessages(list.id)" class="btn btn-primary"">Add</button>
      </div>
    </div>
  </draggable>
</template>

<script>
import Rails from '@rails/ujs';
import draggable from 'vuedraggable';

  export default {
    components: { draggable },

    props: ["original_lists"],
    data: function() {
      return {
        messages: {},
        lists: this.original_lists,
      }
    },

    methods: {
      listMoved: function(event) {
        console.log(event)
        var data = new FormData
        data.append("list[position]", event.newIndex + 1)

        Rails.ajax({
          url: `/list/${this.lists[event.newIndex].id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },

      submitMessages: function(list_id) {
        var data = new FormData
        data.append("card[list_id]", list_id)
        data.append("card[name]", this.messages[list_id])

        Rails.ajax({
          url: "/cards",
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = this.lists.findIndex(item => item.id == list_id)
            this.lists[index].cards.push(data)
            this.messages[list_id] = undefined
          }
        })
      }
    }
  }

</script>

<style scoped>
  /* Min-height for empty column */
  .dragArea {
    min-height: 20px;
  }
</style>
