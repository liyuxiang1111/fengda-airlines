<template>
  <div class="back-container fr boxshadow" v-loading="loading">
    <div class="back-box">退票处理</div>
    <el-empty v-show="backList.length === 0" :image="require('@/assets/image/index/pre-flightFoot.webp')" description="哦！你没有需要退票的订单" :image-size="300"></el-empty>
    <Flight :ticketList="backList"></Flight>
  </div>
</template>

<script>
import Flight from '@/components/Person/Back/Flight.vue'
export default {
  created() {
    this.initBackList()
  },
  components: {
    Flight,
  },
  data() {
    return {
      loading: true,
      backList: [],
      token: '',
      pageNum: 0,
      pageSize: 3,
    }
  },
  methods: {
    async initBackList() {
      this.loading = true,
      await this.$http({
        url: '/ticket/search/return',
        method: 'post',
        data: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        },
      }).then(({ data: res }) => {
        if (res.data === null) {
          this.$message({
            message: "退票成功",
            type: 'success',
          })
        } else {
          this.backList = res.data.dataList
          // console.log(this.backList)
          this.loading = false
        }
      })
    },
  },
}
</script>

<style lang="less" scoped>
.back-container {
  position: relative;
  width: 890px;
  padding: 15px;
  height: 600px;
  background-color: #ffffff;
  .back-box {
    height: 60px;
    padding: 0 20px;
    line-height: 60px;
    border-bottom: 1px solid #cddeea;
  }
  .page-box {
    position: absolute;
    left: 50%;
    margin: 0 -200px;
    bottom: 10px;
  }
}
</style>