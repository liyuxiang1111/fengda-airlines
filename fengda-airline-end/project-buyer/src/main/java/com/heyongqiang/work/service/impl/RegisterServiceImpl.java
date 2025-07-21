package com.heyongqiang.work.service.impl;

import com.alibaba.fastjson.JSON;
import com.heyongqiang.work.dao.mapper.CertificateMapper;
import com.heyongqiang.work.dao.mapper.PassengerMapper;
import com.heyongqiang.work.dao.pojo.Certificate;
import com.heyongqiang.work.dao.pojo.Passenger;
import com.heyongqiang.work.service.RegisterService;
import com.heyongqiang.work.utils.JWTUtils;
import com.heyongqiang.work.vo.ErrorCode;
import com.heyongqiang.work.vo.Result;
import com.heyongqiang.work.vo.params.PassengerPasswordParams;
import com.heyongqiang.work.vo.params.PassengerRegisterParams;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.TreeSet;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Resource
    private PassengerMapper passengerMapper;
    
    @Resource
    private CertificateMapper certificateMapper;

    @Resource
    private RedisTemplate<String,String> redisTemplate;

    private final static String slat = "123hyq!@dsfas";


    public static void main(String[] args) {
        int [] ints={1,5,9,2,5,63,4,8};
        System.out.println("________分割线① rangeClosed 使用_________");
        IntStream.of(ints).sorted().forEach(System.out::println);
        Executors.newFixedThreadPool(4);


    }



    /**
     * 注册用户
     * @param registerParams
     * @return
     */

    @Override
    public Result registerPassenger(PassengerRegisterParams registerParams) {
        Passenger passenger = new Passenger();
        BeanUtils.copyProperties(registerParams,passenger);
        passenger.setUserPwd(DigestUtils.md5Hex(registerParams.getUserPwd()+slat));
        int insert = this.passengerMapper.insert(passenger);
        if(insert == 0){
            Result.fail(ErrorCode.SQL_UPDATE.getCode(),ErrorCode.SQL_UPDATE.getMsg());
        }

        Certificate certificate = new Certificate();
        certificate.setCertificate(registerParams.getCertificate());
        certificate.setCertificateType(registerParams.getCertificateType());
        int insert1 = this.certificateMapper.insert(certificate);
        if(insert1 == 0){
            return Result.fail(ErrorCode.SQL_UPDATE.getCode(),ErrorCode.SQL_UPDATE.getMsg());
        }
        Long certificateId = certificate.getId();
        passenger.setCertificateId(certificateId);
        int update = this.passengerMapper.updateById(passenger);
        if(update == 0){
            return Result.fail(ErrorCode.SQL_UPDATE.getCode(),ErrorCode.SQL_UPDATE.getMsg());
        }
        String token = JWTUtils.createToken(passenger.getId());
        redisTemplate.opsForValue().set("TOKEN_" + token , JSON.toJSONString(passenger),1, TimeUnit.DAYS);
        return Result.success(token);
    }
}
