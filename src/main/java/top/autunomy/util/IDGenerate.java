package top.autunomy.util;

import java.text.SimpleDateFormat;

//返回一个20位随机数作为订单ID

public class IDGenerate {
    public static int Guid=100;

    public static String getGuid() {

        IDGenerate.Guid+=1;

        long now = System.currentTimeMillis();
        //获取4位年份数字
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy");
        //获取时间戳
        String time=dateFormat.format(now);
        String info=now+"";
        //获取三位随机数
        //int ran=(int) ((Math.random()*9+1)*100);
        //要是一段时间内的数据连过大会有重复的情况，所以做以下修改
        int ran=0;
        if(IDGenerate.Guid>999){
            IDGenerate.Guid=100;
        }
        ran= IDGenerate.Guid;

        return time+info.substring(2, info.length())+ran;
    }

}