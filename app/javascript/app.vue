<template>
 <div id="app">
   <p></p>
   <post />
 </div>
</template>

<script>
 import post from './packs/components/post'

 export default {
   data: function () {
     return {
       message: "Hello Vue!"
     }
   },

   components: {
     post: post
   }
 }
</script>

<style scoped>
p {
 font-size: 2em;
 text-align: center;
}
</style>
