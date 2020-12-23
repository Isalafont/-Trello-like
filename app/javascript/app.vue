<template>
  <draggable v-model="lists" v-bind="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <div v-for="(list, index) in original_lists" class="list">
      <h6>{{ list.name }}</h6>

      <draggable v-model="list.cards" v-bind="{group: 'cards'}" class="dragArea" @change="cardMoved">
        <div v-for="(card, index) in list.cards" class="card card-body">
          {{ card.name }}
        </div>
      </draggable>

      <textarea v-model="messages[list.id]" class="form-control mb-1"></textarea>
      <button v-on:click="submitMessages(list.id)" class="btn btn-primary"">Add</button>
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
      cardMoved: function(event){
        const evt = event.added || event.moved
        if (evt == undefined) { return }

        const element = evt.element
        const list_index = this.lists.findIndex((list) => {
          return list.cards.find((card) => {
            return card.id === element.id
          })
        })

        var data = new FormData
        data.append("card[list_id]", this.lists[list_index].id)
        data.append("card[position]", evt.newIndex + 1)

        Rails.ajax({
          url: `cards/${element.id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },

      listMoved: function(event) {
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
  p {
    font-size: 2em;
    text-align: center;
  }

  /* Min-height for empty column */
  .dragArea {
    min-height: 15px;
  }

  .board {
    white-space: nowrap;
    overflow-x: auto;
  }

  .list{
    display: inline-block;
    background: #F4FAFF;
    border-radius: 8px;
    margin-right: 20px;
    padding: 20px;
    vertical-align: top;
    width: 270px;
  }
</style>
