<template>
  <header>
    <div class="leftcontent">
      <el-button @click="handleMenu" plain icon="el-icon-menu" size="mini"></el-button>
      <h3 style="color:#ffffff">首页</h3>
    </div>
    <div class="rightcontent">
      <el-dropdown size="mini">
        <span>
          <img :src="administratorImg">
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>管理员中心</el-dropdown-item>
          <el-dropdown-item>退出</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </header>
</template>
<script>
export default {
  name:'CommonHeader',
  data(){
    return{
      administratorImg:require('../assets/Images/administrator.jpg')
    }
  },
  methods:{
    handleMenu(){
      console.log(this.$store.state.tab.isCollapse)
      this.$store.commit('collapseMenu')
    }
  }
}
</script>

<style lang="less" scoped>
header{
  display: flex;
  height: 100%;
  justify-content: space-between;
  align-items: center;
  .leftcontent{
    display: flex;
    align-items: center;
    .el-button{
      margin-right: 20px;
    }
  }
  .rightcontent{
    .el-dropdown{
      span{
        img{
          height: 40px;
          width: 40px;
          border-radius: 50%;
        }
      }
    }
  }
}
</style>