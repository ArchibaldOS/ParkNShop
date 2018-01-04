package com.ten.ParkNShop.util;

import java.io.*;
import java.util.Iterator;
import java.util.Properties;

/**
 * MySQL数据库备份 
 *
 * @author GaoHuanjie
 */
public class BackupUtil {

    /**
     * Java代码实现MySQL数据库导出
     *
     * @return 返回true表示导出成功，否则返回false。
     * <p>
     * * @param fileName 数据库导出文件文件名
     * @author Archibald
     * hostIP MySQL数据库所在服务器地址IP
     * userName 进入数据库所需要的用户名
     * password 进入数据库所需要的密码
     * avePath 数据库导出文件保存路径
     * databaseName 要导出的数据库名
     */
    public static boolean backup(String fileName,String filePath) throws InterruptedException {
//        System.out.println(filePath);

        Properties properties = new Properties();
        try {
//            properties.load(new FileInputStream(new File("src/main/java/com/ten/ParkNShop/util/backup.properties")));//静态调试

//            InputStream in = BackupUtil.class.getResourceAsStream("backup.properties");

//            使用war部署可以读取到
//            String dir = System.getProperty("user.home");  //获得tomcat所在的工作路径
//            System.out.println(dir);
//
//            //获取到存储了文件存储位置的filedir.properties 文件路径
//            String dir2 = dir.substring(0, dir.length()-4) + File.separator +"webapps" + File.separator + "ROOT" +File.separator + "WEB-INF"
//                    + File.separator + "classes" + File.separator + "META-INF" + File.separator + "config" + File.separator + "backup.properties";
//            InputStream in = new BufferedInputStream (new FileInputStream(dir2));
//            properties.load(in);

            properties.load(new FileInputStream(new File(filePath)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String hostIP = properties.getProperty("hostIP");
        String userName = properties.getProperty("userName");
        String password = properties.getProperty("password");
        String savePath = properties.getProperty("savePath");
        String databaseName = properties.getProperty("databaseName");
//        System.out.println(hostIP+userName);
        File saveFile = new File(savePath);
        if (!saveFile.exists()) {// 如果目录不存在  
            saveFile.mkdirs();// 创建文件夹  
        }
        if (!savePath.endsWith(File.separator)) {
            savePath = savePath + File.separator;
        }
        PrintWriter printWriter = null;
        BufferedReader bufferedReader = null;
        try {
            printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(savePath + fileName), "utf8"));

//            String command = "cmd /c C:/Program Files/MySQL/MySQL Server 5.7/bin>mysqldump -h localhost -u root -p 123456 parknshop > C:\\Users\\Kevin_coco\\Desktop\\GitProject\\ParkNShop\\Backup\\test1.sql";
//            String command = "mysqldump -hlocalhost -uroot -p123456 --set-charset=utf8 parknshop";
//            Process process = Runtime.getRuntime().exec(command);

            Process process = Runtime.getRuntime().exec("mysqldump -h" + hostIP + " -u" + userName + " -p" + password + " --set-charset=UTF8 " + databaseName);
            InputStreamReader inputStreamReader = new InputStreamReader(process.getInputStream(), "utf8");
            bufferedReader = new BufferedReader(inputStreamReader);
            String line;

            while ((line = bufferedReader.readLine()) != null) {
                printWriter.println(line);
            }
            printWriter.flush();

//            System.out.println(process.waitFor());
            if (process.waitFor() == 0) {//0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static boolean recover(String proertiesPath, String filePath) {
        Properties properties = new Properties();
        try {

            properties.load(new FileInputStream(new File(proertiesPath)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String hostIP = properties.getProperty("hostIP");
        String userName = properties.getProperty("userName");
        String password = properties.getProperty("password");
        String databaseName = properties.getProperty("databaseName");

//        System.out.println(hostIP+userName+password+databaseName);
        OutputStream out = null;
        BufferedReader br = null;
        OutputStreamWriter writer = null;

        PrintWriter printWriter = null;
        BufferedReader bufferedReader = null;


        try {

            Process process = Runtime.getRuntime().exec("mysql -h" + hostIP + " -u" + userName + " -p" + password +" "+ databaseName);

            out = process.getOutputStream();//控制台的输入信息作为输出流
            String inStr;
            StringBuffer sb = new StringBuffer("");
            String outStr;
            br = new BufferedReader(new InputStreamReader(
                    new FileInputStream(filePath), "utf8"));
            while ((inStr = br.readLine()) != null) {
                sb.append(inStr + "\r\n");
            }

            outStr = sb.toString();
//            System.out.println(outStr);
            writer = new OutputStreamWriter(out, "utf8");
            writer.write(outStr);
            // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免
            writer.flush();
        } catch (Exception e) {
            return false;
        } finally {
            // 别忘记关闭输入输出流
            try {
                out.close();
                br.close();
                writer.close();
            } catch (IOException e) {
                return false;

            }
            return true;
////            System.out.println(process.waitFor());
//            if(process.waitFor() == 0){//0 表示线程正常终止。
//                return true;
//            }
//        }catch (IOException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }


//    public static void main(String[] args){
//        try {
//            if (backup("test1.sql")) {
//                System.out.println("数据库成功备份！！！");
//            } else {
//                System.out.println("数据库备份失败！！！");
//            }
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//    }
        }
    }
}  