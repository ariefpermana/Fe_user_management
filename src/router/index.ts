import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "user.home",
      component: () => import("@/views/user/Index.vue"),
    },
    {
      path: "/add",
      name: "user.add",
      component: () => import("@/views/user/Add.vue"),
    },
    {
      path: "/edit/:id",
      name: "user.edit",
      component: () => import("@/views/user/Edit.vue"),
    },
  ],
});

export default router;
