<template>
  <el-menu
      default-active="2"
      class="el-menu-vertical-demo"
      @open="handleOpen"
      @close="handleClose"
      :collapse="IsCollapse"
      background-color="#545c64"
      text-color="#fff"
      active-text-color="#ffd04b">
      <h3>{{IsCollapse ? '凤航' : '凤达航空管理员界面'}}</h3>
      <el-menu-item v-for="item in noChildren" :index="item.path+''" :key="item.path" @click="clickMenu(item)">
        <i v-show="IsCollapse" style="color:white; font-style:normal;">{{item.label.substring(0,2)}}</i>
        <span slot="title">{{item.label}}</span>
      </el-menu-item>
      <!-- <el-submenu v-for="item in hasChildren" :index="item.path+''" :key="item.path">
        <template slot="title">
          <span>{{item.label}}</span>
        </template>
        <el-menu-item-group v-for="(subItem,subIndex) in item.children" :key="subItem.path" @click="clickMenu(item)">
          <el-menu-item :index="subIndex+''">{{subItem.label}}</el-menu-item>
        </el-menu-item-group>
      </el-submenu> -->
    </el-menu>
</template>
<script>
  export default {
    data(){
      return{
        menu:[
          {path:'/home',name:"AppHome",label:"首页",url:"/home"},
          {path:"/flight",name:"AppFlight",label:"航班管理",url:"NallManage/MallMa"},
          {path:"/user",name:"AppUser",label:"用户管理",url:"UserManage/UserMa"},
          {path:"/request",name:"AppRequest",label:"请求处理",url:"UserManage/UserMa"},
          // {label:"其他",children:[
          //   {path:"/page1",name:"page1",label:"页面1",icon:"setting",url:"other/PageOne"},
          //   {path:"/page2",name:"page2",label:"页面2",icon:"setting",url:"other/PageTwo"},
          // ]}
        ],
      }
    },
    methods: {
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      },
      clickMenu(item){
        this.$router.push({
          name:item.name,
        })
      }
    },
    computed:{
      noChildren(){
        return this.menu.filter(item => !item.children)
      },
      hasChildren(){
        return this.menu.filter(item => item.children)
      },
      IsCollapse(){
        return this.$store.state.tab.isCollapse
      }
    }
  }
</script>
<style lang="less" scoped>
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
  }
  .el-menu{
    height: 100vh;
    border: none;
    text-align: center;
    h3{
      color: #ffffff;
      line-height: 48px;
    }
  }
</style>