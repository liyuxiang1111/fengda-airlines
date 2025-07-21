package com.heyongqiang.controller.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.heyongqiang.controller.dao.mapper.SaleManMapper;
import com.heyongqiang.controller.dao.pojo.Salesman;
import com.heyongqiang.controller.service.LoginService;
import com.heyongqiang.controller.vo.Result;
import com.heyongqiang.controller.vo.params.LoginParams;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    private SaleManMapper saleManMapper;


    @Override
    public Result login(LoginParams loginParams) {
        /**
         * 管理员登录直接用户名密码
         */
        String userName= loginParams.getUserName();
        String userPwd = loginParams.getUserPwd();
        LambdaQueryWrapper<Salesman> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Salesman::getSalesmanName,userName);
        Salesman salesman = saleManMapper.selectOne(queryWrapper);
        if(salesman == null){
            return Result.fail(200,"用户不存在");
        }
        if(!userPwd.equals(salesman.getSalesmanPwd())){
            return Result.fail(201,"密码错误");
        }
        return Result.success(salesman);
    }
}
