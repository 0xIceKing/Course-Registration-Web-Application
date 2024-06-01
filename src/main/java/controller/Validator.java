package controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
    public static boolean validateMaSinhVien(String maSinhVien) {
        String maSinhVienPattern = "N\\d{2}[A-Z]{4}\\d{3}"; 
        return maSinhVien.matches(maSinhVienPattern);
    }
    
    public static boolean validateHoTen(String hoTen) {
        String hoTenPattern = "^[A-ZÀ-Ỹ][a-zà-ỹ]*(?:\\s[A-ZÀ-Ỹ][a-zà-ỹ]*)*$"; 
        return hoTen.matches(hoTenPattern);
    }
    
    public static boolean validateSoDienThoai(String soDienThoai) {
        String soDienThoaiPattern = "^0\\d{9}$"; 
        return soDienThoai.matches(soDienThoaiPattern);
    }
    
    public static boolean validateCCCD(String cccd) {
        String cccdPattern = "^\\d{10}$"; 
        return cccd.matches(cccdPattern);
    }
    
    public static boolean validateEmail(String email) {
        String emailPattern = "^\\w+@\\w+(\\.\\w+)+(\\.\\w+)*$";
        return email.matches(emailPattern);
    }
    
    public static boolean validateMaMonHoc(String maMonHoc) {
        String mmhPattern = "^\\d{6}$"; 
        return maMonHoc.matches(mmhPattern);
    }
    
    public static boolean validateTenMonHoc(String tenMonHoc) {
        String tmhPattern = "^[a-zA-ZÀ-ỹ0-9\\s]+$"; 
        return tenMonHoc.matches(tmhPattern);
    }
}
