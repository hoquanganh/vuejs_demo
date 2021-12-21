<template>
 <div class="card">
   <div class="card-header">
     <h3 class="card-title">
       Posts
     </h3>
   </div>

   <table class="table card-table">
     <thead>
       <tr>
         <th>Title</th>
         <th>Body</th>
       </tr>
     </thead>

     <tbody>

       <tr v-for="post in posts" :key="post.title">
         <td></td>
         <td></td>
       </tr>
     </tbody>
   </table>
 </div>

</template>

<script>
 import axios from 'axios';
 export default {
   data: () => ({
     posts: []
   }),

   created: function () {
     this.fetchPosts();
   },

   methods: {
     fetchPosts () {
       axios.get('/posts').then(response => {
         this.posts = response.data;
       });
     },
   }
 };
</script>
