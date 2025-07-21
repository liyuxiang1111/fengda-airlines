<template>
  <div>
    <el-container style="height:100%">
      <el-aside width="auto">
        <Common-aside></Common-aside>
      </el-aside>
      <el-container>
        <el-header>
          <Common-header></Common-header>
        </el-header>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>
<script>
import CommonAside from '../components/CommonAside.vue'
import CommonHeader from '../components/CommonHeader.vue'
export default {
  name: 'AppMain',
  data(){
    return{}
  },
  components:{
    CommonAside,
    CommonHeader,
  }
}
</script>
<style lang="less" scoped>
.el-header{
  background-color: #333;
}
.el-main{
  padding-top: 0;
}
</style>