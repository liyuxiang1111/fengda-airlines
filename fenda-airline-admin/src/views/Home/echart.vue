<template>
  <div
    id="myChart"
    :style="{width: '1000px', height: '720px'}"
  ></div>
</template>
<script>
import * as echarts from 'echarts'
import '@/assets/js/china';
import option from './map-option'
export default {
  name:'chinaEcharts',
  data(){
      return{
      }
  },
  methods:{
    drawEcharts(){
      var myChart = echarts.init(document.getElementById('myChart'))
      myChart.setOption(option,true)
    }
  },
  mounted(){
      this.drawEcharts();
  }
}
</script>