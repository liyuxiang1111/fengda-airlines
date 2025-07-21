import axios from 'axios'

// const ERR_ok = 0; 

const request = axios.create({
  baseURL:'http://localhost:8889'
})

export default request

// export function get(url) {
//   return function (params) {
//     axios.get(url, {
//       params
//     })
//       .then(res => {
//         const {
//           errno,
//           data
//         } = res.data;
//         if (errno === ERR_ok) {
//           return data;
//         }
//       })
//   }
// }