package com.crf.server.base.common;

import java.security.Key;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.crypto.Cipher;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.crf.server.base.exception.CryptoException;

public class SecurityUtil {

    private static final String ENCRYPTION_TRANSFORMATION = "AES";
    private static final String FORMATTER1_PATTERN        = "yyyy.MM.dd.hh.ss";
    private static final String FORMATTER2_PATTERN        = "yyyy MM dd hh:ss";
    private static final String FORMATTER3_PATTERN        = "yyyy/MM-dd-hh ss";

    public static String getSystemUsername() {

        SecurityContext context = SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();

        return authentication.getName();
    }

    public static String generateDateBasedToken1(String username, Date date) {

        SimpleDateFormat formatter = new SimpleDateFormat(FORMATTER1_PATTERN);
        SimpleDateFormat formatter2 = new SimpleDateFormat(FORMATTER2_PATTERN);
        SimpleDateFormat formatter3 = new SimpleDateFormat(FORMATTER3_PATTERN);

        StringBuilder sb = new StringBuilder();
        sb.append(ServerConstants.SYSTEM_TOKEN_PREFIX).append(".").append(username).append(".").append(formatter.format(date)).append(".");
        sb.append(formatter2.format(date)).append("-").append(formatter3.format(date)).append(".").append(ServerConstants.SYSTEM_TOKEN_SUFFIX1);

        return DigestUtils.sha256Hex(sb.toString());
    }

    public static String generateDateBasedToken2(String username, Date date) {

        SimpleDateFormat formatter = new SimpleDateFormat(FORMATTER1_PATTERN);
        SimpleDateFormat formatter2 = new SimpleDateFormat(FORMATTER2_PATTERN);
        SimpleDateFormat formatter3 = new SimpleDateFormat(FORMATTER3_PATTERN);

        StringBuilder sb = new StringBuilder();
        sb.append(ServerConstants.SYSTEM_TOKEN_PREFIX).append("..").append(username).append("..").append(formatter3.format(date)).append("-");
        sb.append(formatter2.format(date)).append("..").append(formatter.format(date)).append("..").append(ServerConstants.SYSTEM_TOKEN_SUFFIX2);

        return DigestUtils.sha256Hex(sb.toString());
    }

    public static String generateUniqueCode() {

        return DigestUtils.sha256Hex(UUID.randomUUID().toString().replaceAll("-", "") + System.currentTimeMillis());
    }

    public static String generateSecureRandom16CharReference() {

        // reference code generated by this method will be a 16 character long alphanumeric string starting with 'CRF' and having a minimum of 8 other letters and 5 digits
        String upperCaseLetters = RandomStringUtils.random(8, 65, 90, true, true, null, new SecureRandom()); // A-Z
        String numbers = RandomStringUtils.randomNumeric(5);
        String combinedChars = upperCaseLetters.concat(numbers);

        List<Character> refChars = combinedChars.chars().mapToObj(c -> (char) c).collect(Collectors.toList());
        Collections.shuffle(refChars);

        String reference = refChars.stream().collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();
        reference = "CRF" + reference;

        return reference;
    }

    public static byte[] encrypt(Key secretKey, byte[] inputBytes) throws CryptoException {
        return doCrypto(Cipher.ENCRYPT_MODE, secretKey, inputBytes);
    }

    public static byte[] decrypt(Key secretKey, byte[] inputBytes) throws CryptoException {
        return doCrypto(Cipher.DECRYPT_MODE, secretKey, inputBytes);
    }

    private static byte[] doCrypto(int cipherMode, Key secretKey, byte[] inputBytes) throws CryptoException {

        try {

            Cipher cipher = Cipher.getInstance(ENCRYPTION_TRANSFORMATION);
            cipher.init(cipherMode, secretKey);
            return cipher.doFinal(inputBytes);

        } catch (Exception ex) {
            throw new CryptoException("Error encrypting/decrypting file", ex);
        }
    }

}
