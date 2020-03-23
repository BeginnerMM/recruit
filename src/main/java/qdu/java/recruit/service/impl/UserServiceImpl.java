package qdu.java.recruit.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.UserEntity;
import qdu.java.recruit.mapper.UserMapper;
import qdu.java.recruit.service.UserService;
import qdu.java.recruit.util.EncodingByMd5Util;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger logger = LogManager.getLogger();

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserEntity getUser(int userId) {
        return userMapper.getUser(userId);
    }

    @Override
    public boolean updateUser(UserEntity userEntity) {

        String password = userEntity.getPassword();

        int result = -1;
        try {
            String encPass = EncodingByMd5Util.EncodingByMd5(password);
            userEntity.setPassword(encPass);
            result = userMapper.updateUser(userEntity);
        } catch (NoSuchAlgorithmException e) {
            logger.error("md5加密出错");
        } catch (UnsupportedEncodingException e) {
            logger.error("编码转化出错");

        }
        if (result > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean registerUser(UserEntity userEntity) {

        String password = userEntity.getPassword();

        int result = -1;
        try {
            String encPass = EncodingByMd5Util.EncodingByMd5(password);
            userEntity.setPassword(encPass);
            result = userMapper.saveUser(userEntity);

        } catch (NoSuchAlgorithmException e) {
            logger.error("md5加密出错");
        } catch (UnsupportedEncodingException e) {
            logger.error("编码转化出错");
        }

        if (result > 0) {
            return true;
        }
        return false;

    }

    @Override
    public boolean loginUser(String mobile, String password) {

        if (userMapper.getUserByMobile(mobile) == null) {
            logger.info("不存在该用户");
            return false;
        }
        String passwordDB = userMapper.getUserByMobile(mobile).getPassword();

        try {
            if (EncodingByMd5Util.EncodingByMd5(password).equals(passwordDB)) {
                return true;
            }
        } catch (NoSuchAlgorithmException e) {
            logger.error("md5加密出错");
        } catch (UnsupportedEncodingException e) {
            logger.error("编码转化错误");
        }
        return false;
    }

    @Override
    public UserEntity getUserByMobile(String mobile) {

        return userMapper.getUserByMobile(mobile);
    }


}

