<template>
     <router-link to="/" class="btn btn-primary" tag="button" id="button-primary">
        Back
    </router-link>
    <div class="card rounded shadow" style="width:500px;margin:auto;">
        <div class="card-header">
            Edit User
        </div>
        <div class="card-body" style="padding:20px;"> 
            <form @submit.prevent="editData">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nama</label>
                    <input type="text" class="form-control" id="name" v-model=user.name required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" v-model="user.email" required>
                </div>
                <select class="form-select" aria-label="Default select example" id="jenis_kelamin" v-model="user.jenis_kelamin" required>
                    <option selected disabled value="">Pilih Jenis Kelamin</option>
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                </select>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Alamat</label>
                    <textarea class="form-control" id="alamat" v-model="user.alamat" rows="3" required></textarea>
                </div>
                <select class="form-select" aria-label="Default select example" id="role_Id" v-model.number="user.role_id" required>
                    <option selected disabled value="">Pilih Role</option>
                    <option value="0">Admin</option>
                    <option value="1">Developer</option>
                    <option value="2">QA</option>
                </select>
                <form-hidden v-model="user.created_on"></form-hidden>
                <br>
                <button class="btn btn-outline-primary">Submit</button>
            </form>
        </div>
           </div>
</template>

<script>
import { useRouter, useRoute } from 'vue-router'
import axios from 'axios'

  export default {
    name: "Edit",
    data() {
      return {
        user: {
            user_id:'',
            name: '',
            email: '',
            jenis_kelamin: '',
            role_id: '',
            alamat: '',
            created_on: '',
            lastupdated: ''
        },
        date_time:'',
      };
    },
    mounted() {
        this.getDataUsers()
    },
    methods: {
      getDataUsers(){
        const route = useRoute()
        const id = route.params.id

        axios
        .get("http://127.0.0.1:8080/api/users/"+id)
        .then((response) => {
            this.user = response.data
        })
        .catch((error) => {
          console.log(error.statusText);
        })
      },
      editData(){
            this.currentDateTime()
            axios
                .put('http://127.0.0.1:8080/api/users/'+this.user.user_id, this.user)
                .then((response) => {
                    if(response.status == 200){
                        this.$router.push('/')
                    }
                })
                .catch((error) => {
                    this.$router.push('/edit')
                    throw new TypeError("Failed Update User")
                })
        },
        currentDateTime() {
            const current = new Date();
            const date = current.getFullYear()+'-'+('0'+(current.getMonth() + 1)).slice(-2) +'-'+ ('0' + current.getDate()).slice(-2);
            const time = ('0'+current.getHours()).slice(-2)+ ":" + ('0'+current.getMinutes()).slice(-2) + ":" + current.getSeconds();
            const dateTime = date +'T'+ time;
            console.log(dateTime)
            this.user.lastupdated = dateTime;
        }
      },
  };
</script>