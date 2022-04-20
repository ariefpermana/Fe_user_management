<template>
     <router-link to="/" class="btn btn-primary" tag="button" id="button-primary">
        Back
    </router-link>
    <div class="card rounded shadow" style="width:500px;margin:auto;">
        <div class="card-header">
            Add New User
        </div>
        <div class="card-body" style="padding:20px;"> 
            <form @submit.prevent="postData">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Nama</label>
                    <input type="text" class="form-control" id="name" placeholder="arief permana" v-model="formData.name" required>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="ariefpermana@gmail.com" v-model="formData.email" required>
                </div>
                <select class="form-select" aria-label="Default select example" id="jenis_kelamin" v-model="formData.jenis_kelamin" required>
                    <option selected disabled value="">Pilih Jenis Kelamin</option>
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                </select>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Alamat</label>
                    <textarea class="form-control" id="alamat" rows="3" v-model="formData.alamat" required></textarea>
                </div>
                <select class="form-select" aria-label="Default select example" id="role_Id" v-model.number="formData.role_id" required>
                    <option selected disabled value="">Pilih Role</option>
                    <option value="0">Admin</option>
                    <option value="1">Developer</option>
                    <option value="2">QA</option>
                </select>
                <br>
                <button class="btn btn-outline-primary">Submit</button>
            </form>
        </div>
           </div>
</template>

<script>
import axios from "axios";

export default {
    name: "Add",
    data() {
        return {
            formData : {
                name: '',
                email: '',
                jenis_kelamin: '',
                role_id: '',
                alamat: '',
                created_on: '',
                lastupdated:''
            }
        }
    },
    mounted() {
        this.currentDateTime()
    },
    methods: {
        postData(){
            axios
                .post('http://127.0.0.1:8080/api/users', this.formData)
                .then((response) => {
                    if(response.status == 201){
                        this.$router.push('/')
                    }
                })
                .catch((error) => {
                    this.$router.push('/add')
                    throw new TypeError("Failed Add User")
                })
        },
        currentDateTime() {
            const current = new Date();
            const date = current.getFullYear()+'-'+('0'+(current.getMonth() + 1)).slice(-2) +'-'+ ('0' + current.getDate()).slice(-2);
            const time = ('0'+current.getHours()).slice(-2)+ ":" + ('0'+current.getMinutes()).slice(-2) + ":" + current.getSeconds();
            const dateTime = date +'T'+ time;

            this.formData.created_on = dateTime;
        }
    }
}
</script>