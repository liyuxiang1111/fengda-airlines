<template>
  <div class="flight-container" >
    <div v-for="item in ticketList" :key="item.ticketId">
      <div class="minTit">
        <span class="num">订单号：{{ item.ticketId }}</span>
        <span class="time">订单时间：{{ item.ticketDay }} - {{ item.beginTime }}</span>
        <span class="price">￥{{ item.ticketPrice }}</span>
      </div>
      <div class="ticketInfo">
        <table>
          <tr>
            <th style="width: 13%">联系人</th>
            <th style="width: 13%">航班</th>
            <th style="width: 22%">出发</th>
            <th style="width: 22%">到达</th>
            <th style="width: 17%">状态</th>
            <th style="width: 13%">操作</th>
          </tr>
          <tr>
            <td>{{ item.buyerName }}</td>
            <td>{{ item.flightName }}</td>
            <td>
              <p>{{ item.beginCity }}</p>
            </td>
            <td>
              <p>{{ item.endCity }}</p>
            </td>
            <td style="line-height: 25px"><span> 已取消 </span></td>
            <td class="modify">
              <slot name="defalt" :ticketId="item.ticketId" :ticketDay="item.ticketDay"></slot>
            </td>
          </tr>
        </table>
      </div>
    </div>
    <Page class="page"></Page>
  </div>
</template>

<script>
import Page from '@/components/Person/Page.vue'
export default {
  components: {
     Page
  },
  data() {
    return {
      token: '',
    }
  },
  props: {
    ticketList: {
      type: Array
    },
  },
  methods: {
    async back(e, id) {
      await this.$http({
        url: '/ticket/return',
        method: 'post',
        headers: {
          Authorization: this.token,
        },
        data: {
          ticketId: id,
          resource: '七天无理由',
        },
      }).then(({ data: res }) => {
        if (res.data === null) {
          this.$message({
            message: "退票成功！",
            type: 'success',
          })
        } else {
          this.$message({
            message: "退票失败！",
            type: 'error',
          })
        }
      })
    },
    async change(e, day, id) { 
      // 修改日期
      var arr = day.split('-')
      var ans = ''
      var month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      if (month[arr[0] - 1] === parseInt(arr[1])) {
        if (arr[0] === '12') {
          ans = '1-'
        } else {
          ans = parseInt(arr[0]) + 1 + '-1'
        }
      } else {
        var flag = parseInt(arr[1]) + 1
        ans = arr[0] + '-' + flag
      }
      // http请求
      await this.$http({
        url: '/ticket/modify',
        method: 'post',
        headers: {
          Authorization: this.token,
        },
        data: {
          ticketDay: ans,
          ticketId: id,
        },
      }).then(({ data: res }) => {
        if (res.data === null) {
          this.$message({
            message: "改签成功！",
            type: 'success',
          })
        } else {
          this.$message({
            message: "改签成功！",
            type: 'error',
          })
        }
      })
    },
  },
}
</script>

<style lang="less" scoped>
.flight-container {
  height: 140px;
  .page {
    padding-top: 50px;
    text-align: center;
  }
  .minTit {
    position: relative;
    padding: 0 20px 0 12px;
    line-height: 50px;
    .num {
      font-size: 12px;
      color: #4a4a4a;
    }
    .time {
      margin-left: 10px;
      font-size: 12px;
      color: #4a4a4a;
    }
    .price {
      float: right;
      font-size: 15px;
      color: #ff8214;
    }
  }
  .minTit::before {
    content: '';
    position: absolute;
    width: 2px;
    height: 20px;
    background: #ff8214;
    left: 0;
    top: 18px;
  }
  .ticketInfo {
    height: 90px;
    table {
      width: 100%;
      border-collapse: collapse;
      tr {
        line-height: 50px;
        th {
          font-size: 12px;
          color: #093a57;
          font-weight: 400;
          line-height: 40px;
          text-align: center;
          border-right: 1px solid #e1e4e7;
          background: #eff6fd;
        }
        td {
          font-size: 13px;
          font-weight: 400;
          color: #000;
          text-align: center;
          border-right: 1px solid #e1e4e7;
        }
      }
    }
  }
}
</style>
