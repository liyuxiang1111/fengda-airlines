<template>
  <div>
    <el-row style="margin-top:20px">
      <el-col
        :span="23"
        style="height:867px"
      >
        <el-card shadow="hover">
          <el-table
            :data="tableData"
            style="width: 100%"
            height="867px"
            stripe
          >
            <el-table-column
              prop="flightId"
              label="航班编号"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="id"
              label="请求编号"
              width="200"
            >
            </el-table-column>
            <el-table-column
              prop="iswatch"
              label="处理状态"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="passengerName"
              label="乘客姓名"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="passengerTelephone"
              label="乘客电话"
              width="180"
            >
            </el-table-column>
            <el-table-column
              prop="reason"
              label="理由"
              width="180"
            >
            </el-table-column>
            <el-table-column
              prop="seat"
              label="座位号"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="ticketId"
              label="订单编号"
              width="180"
            >
            </el-table-column>
            <el-table-column
              prop="ticketPrice"
              label="机票价格"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="time"
              label="请求时间"
              width="180"
            >
            </el-table-column>
            <el-table-column
              prop="userId"
              label="用户编号"
              width="100"
            >
            </el-table-column>
            <el-table-column
              label="操作"
              width="120"
              align="center"
              fixed="right"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  @click="popUp(scope.$index, scope.row)"
                >处理</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog
      title="请求处理"
      :visible.sync="dialogVisible"
      width="30%"
      center
    >
      <span class="text">是否同意该用户的对款申请</span>
      <span
        slot="footer"
        class="dialog-footer"
      >
        <el-button @click="processing(false)">不 同 意</el-button>
        <el-button
          type="primary"
          @click="processing(true)"
        >同 意</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name:"AppRequest",
  data(){
    return{
      tableData:[],
      dialogVisible:false,
      lineNumber:'',
    }
  },
  methods:{
    getData(){
      this.$api.getRequestData().then((res) => {
        // console.log(res)
        this.tableData = res.data.data
        return res
      })
    },
    updateData(ticketId, option){
      this.$api.updateRequestData(ticketId, option)
    },
    toStringing(){
      for(var i = 0; i < this.tableData.length; i++){
        this.tableData[i].iswatch = this.tableData[i].iswatch.toString()
      }
    },
    popUp(index,row){
      this.dialogVisible = true
      console.log(row)
      this.lineNumber = index
      console.log(this.lineNumber)
    },
    processing(agreement){
      this.tableData[this.lineNumber].iswatch == 'true'
      var ticketId = this.tableData[this.lineNumber].ticketId
      var option = agreement
      this.updateData(ticketId, option)
      this.dialogVisible = false
    }
  },
  mounted(){
    // console.log('c')
    this.getData()
  },
  updated(){
    this.toStringing()
    // console.log(this.tableData)
  }
}
</script>
<style lang="less" scoped>
.el-dialog{
  .text{
    display: inline-block;
    width: 100%;
    text-align: center;
  }
}
</style>