<template>
    <el-pagination background layout="prev, pager, next" :total="50" @prev-click="prev" @next-click="next"> </el-pagination>
</template>

<script>
export default {
  methods: {
    prev() {
      console.log('前一页')
    },
    next() {
      console.log('下一页')
    },
  },
}
</script>
