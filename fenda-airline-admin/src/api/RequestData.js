import request from "./request";

export function getRequestData(params = {}) {
  return request({
    method: 'get',
    url: '/ticket/search/return',
    params
  })
}
export function updateRequestData(ticketId, option) {
  console.log(ticketId)
  console.log(option)
  request({
    method: 'post',
    url: '/ticket/watch',
    params: {ticketId}
  })
}