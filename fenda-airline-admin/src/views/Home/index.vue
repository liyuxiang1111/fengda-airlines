<template>
  <el-row
    class="home"
    :gutter="20"
    style="margin-top:20px"
  >
    <el-col
      class="leftcol"
      :span="8"
    >
      <el-card
        class="mainInfo"
        shadow="hover"
      >
        <div class="administrator">
          <img :src="administratorImg">
          <div class="administratorInfo">
            <p class="name">Admin</p>
            <p class="access">超级管理员</p>
          </div>
        </div>
        <div class="login-info">
          <p>上次登录的时间：<span>2022-9-19</span></p>
          <p>上次登录的地点：<span>月球</span></p>
        </div>
      </el-card>
      <el-card
        style="height:660px;margin-top:20px;"
        shadow="hover"
      >
        <el-table
          :data="tableData"
          style="width: 100%"
        >
          <el-table-column
            prop="passengerName"
            label="请求人"
            width="100"
          >
          </el-table-column>
          <el-table-column
            prop="time"
            label="请求时间"
            width="180"
          >
          </el-table-column>
          <el-table-column
            prop="id"
            label="请求编号"
          >
          </el-table-column>
        </el-table>
      </el-card>
    </el-col>
    <el-col
      class="rightcol"
      :span="15"
    >
      <el-card
        class="echartsbox"
        shadow="hover"
        style="height:907px;"
      >
        <h1 class="echartsname">用户订票位置分布图</h1>
        <Echarts></Echarts>
      </el-card>
      <!-- <el-card shadow="hover" style="height:440px;margin-top:20px;"></el-card> -->
    </el-col>
  </el-row>
</template>

<script>
import Echarts from './echart.vue'
export default {
  name: 'AppHome',
  data(){
    return{
      administratorImg:require('@/assets/Images/administrator.jpg'),
      tableData:[],
    }
  },
  methods:{
    getData(){
      this.$api.getRequestData().then((res) => {
        console.log(res)
        this.tableData = res.data.data
        return res
      })
    }
  },
  mounted(){
    console.log('c')
    this.getData()
  },
  components:{
    Echarts,
  }
}
</script>

<style lang="less" scoped>
.home{
  margin-top: 20px;
  .leftcol{
    .mainInfo{
      position: relative;
      .administrator{
        img{
          float: left;
          height: 140px;
          width: 140px;
          border-radius: 50%;
          padding-right: 20px;
        }
        .administratorInfo{
          .name{
            font-size: 24px;
          }
        }
        &::after{
          height: 1px;
          width: 100%;
          background-color: gray;
        }
      }
      .login-info{
        float: left;
      }
    }
  }
  .rightcol{
    .echartsbox{
      .echartsname{
        font-size: 30px;
        text-align: center;
      }
    }
  }
}
</style>
