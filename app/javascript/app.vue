<template>
  <draggable v-model="lists" v-bind="{group: 'lists'}" class="board dragArea" @end="listMoved">
    <list v-for="(list, index) in lists" :list="list"></list>
  </draggable>
</template>

<script>
import Rails from '@rails/ujs';
import draggable from 'vuedraggable';
import list from 'components/list';

  export default {
    components: { draggable, list },

    props: ["original_lists"],
    data: function() {
      return {
        lists: this.original_lists,
      }
    },

    methods: {

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
    white-space: wrap;
    overflow-x: auto;
  }
</style>
