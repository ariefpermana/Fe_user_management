<template>
    <router-link to="/add" class="btn btn-primary" tag="button" id="button-primary">
        Add User
    </router-link>

    <div class="card">
        <div class="card-header">
            User List
        </div>
        <table class="table">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Nama</th>
                <th scope="col">Email</th>
                <th scope="col">Alamat</th>
                <th scope="col">Jenis Kelamin</th>
                <th scope="col">Role</th>
                <th scope="col">Created Date</th>
                <th scope="col">Updated Date</th>
                <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
               <tr v-for="users in listUser" :key="users.user_id">
                <th scope="row">1</th>
                <td>{{users.name}}</td>
                <td>{{users.email}}</td>
                <td>{{users.alamat}}</td>
                <td>{{users.jenis_kelamin}}</td>
                <td>{{users.role_id}}</td>
                <td>{{users.created_on}}</td>
                <td>{{users.lastupdated}}</td>
                <td>
                    <router-link :to="{name: 'user.edit', params:{id:users.user_id}}" class="btn btn-warning" tag="button" style="margin-right:5px;">Edit</router-link>
                    <button class="btn btn-danger" tag="button" v-on:click="deleteUser(users.user_id)">Hapus</button>
                </td>
                </tr>
            </tbody>
        </table>
    </div>
            
</template>

<script>
  import axios from "axios";

  export default {
    data() {
      return {
        listUser: []
      };
    },
    mounted() {
      this.getDataUsers()
    },
    methods: {
      getDataUsers(){
        axios
        .get("http://127.0.0.1:8080/api/users")
        .then((response) => {
            this.listUser = response.data
        })
        .catch((error) => {
          console.log(error.statusText);
        })
      },
      deleteUser(id){
        axios
        .delete("http://127.0.0.1:8080/api/users/"+id)
        .then((result) => {
            this.getDataUsers()
        })
      }
    }
  };
 </script>