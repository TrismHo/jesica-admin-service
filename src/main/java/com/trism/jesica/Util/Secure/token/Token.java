package com.trism.jesica.Util.Secure.token;

import com.trism.jesica.Util.Secure.DateUtils;
import io.jsonwebtoken.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Key;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

@Slf4j
@RequiredArgsConstructor
public class Token {

    private final String token;
    private final Key key;
    public static final String ROLE = "role";
    public static final SignatureAlgorithm ALGORITHM = SignatureAlgorithm.HS512;

    public Token(String id, Date expiry, Key key) {
        this.key = key;
        this.token = createToken(id ,expiry);
    }


    public Token(String id, Date expiry, String role, Key key) {
        this.key = key;
        this.token = createToken(id ,expiry, role);
    }

    public Token(String id, long expiryInMilliseconds, Key key) {
        this.key = key;
        this.token = createToken(id ,expiryInMilliseconds);
    }


    public Token(String id, long expiryInMilliseconds, String role, Key key) {
        this.key = key;
        this.token = createToken(id ,expiryInMilliseconds, role);
    }

    public Token(String subject, long expiryInMilliseconds, Claims claims, Key key) {
        this.key = key;
        this.token = createToken(subject ,claims, expiryInMilliseconds);
    }

    public Token(String subject, long expiryInMilliseconds, Map<String, Object> claimsMap, Key key) {
        this.key = key;
        this.token = createToken(subject ,claimsMap, expiryInMilliseconds);
    }


    public Token(String subject, Date expiry, Claims claims, Key key) {
        this.key = key;
        this.token = createToken(subject ,claims, expiry);
    }

    public Token(String subject, Date expiry, Map<String, Object> claimsMap, Key key) {
        this.key = key;
        this.token = createToken(subject ,claimsMap, expiry);
    }

    public Token(String subject, Date nowDate,Date expiry, Map<String, Object> claimsMap, Key key) {
        this.key = key;
        this.token = createToken(claimsMap, subject, nowDate, expiry);
    }

    public boolean isClaims() {
        return this.getTokenClaims() != null;
    }

    public Claims getAllClaimsFromToToken(String token) {
        try {
            return Jwts.parserBuilder()
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
        } catch (SecurityException e) {
            log.info("Invalid JWT signature.");
        } catch (MalformedJwtException e) {
            log.info("Invalid JWT token.");
        } catch (ExpiredJwtException e) {
            log.info("Expired JWT token.");
        } catch (UnsupportedJwtException e) {
            log.info("Unsupported JWT token.");
        } catch (IllegalArgumentException e) {
            log.info("JWT token compact of handler are invalid.");
        }
        return null;
    }

    public Claims getTokenClaims() {
        return getAllClaimsFromToToken(this.token);
    }


    public Claims getExpiredTokenClaims() {
        try {
            Jwts.parserBuilder()
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
        } catch (ExpiredJwtException e) {
            log.info("Expired JWT token.");
            return e.getClaims();
        }
        return null;
    }

    public Object getValue(String token ,String key) {
        final Claims claims = getAllClaimsFromToToken(token);
        log.debug("claims = {}", claims);
        return claims.get(key);
    }

    public Object getValue(String key) {
        final Claims claims = getAllClaimsFromToToken(this.token);
        log.debug("claims = {}", claims);
        return claims.get(key);
    }



    public String getSubjectFromToken(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    private Date getExpirationFromToken(String token) {
        return extractClaim(token, Claims::getExpiration);
    }


    public Set<Map.Entry<String, Object>> getEntryFromToken(String token) {
        return extractClaim(token, Claims::entrySet);
    }


    public Boolean isSign(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(key)
//                .setSigningKey(publicKey)
                .build()

                .isSigned(token);
    }

    public Boolean validateToken(String token) {
        return !isTokenExpired(token);
    }


    public Boolean isTokenExpired() {
        try {
            return getExpirationFromToken(token).before(DateUtils.nowDate());
        } catch (Exception e) {
            log.info("Token expired! token={}", token);
            return true;
        }
    }


    public Boolean isTokenExpired(String token) {
        try {
            return getExpirationFromToken(token).before(DateUtils.nowDate());
        } catch (Exception e) {
            log.info("Token expired! token={}", token);
            return true;
        }
    }

    protected <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToToken(token);
        return claimsResolver.apply(claims);
    }


    private String createToken(String id, Date expiry) {
        final Date nowDate = DateUtils.nowDate();
        return Jwts.builder()
                .setSubject(id)
                .setExpiration(expiry)
                .setIssuedAt(nowDate)
                .signWith(key, ALGORITHM)
                .compact();
    }

    private String createToken(String id, Date expiry, String role) {
        final Date nowDate = DateUtils.nowDate();
        return Jwts.builder()
                .claim(ROLE, role)
                .setSubject(id)
                .setExpiration(expiry)
                .setIssuedAt(nowDate)
                .signWith(key, ALGORITHM)
                .compact();
    }

    private String createToken(String id, long expiryInMilliseconds) {
        final Date nowDate = DateUtils.nowDate();
        final Date expiry = new Date(nowDate.getTime() + expiryInMilliseconds);
        return Jwts.builder()
                .setSubject(id)
                .setExpiration(expiry)
                .setIssuedAt(nowDate)
                .signWith(key, ALGORITHM)
                .compact();
    }

    private String createToken(String id, long expiryInMilliseconds, String role) {
        final Date nowDate = DateUtils.nowDate();
        final Date expiry = new Date(nowDate.getTime() + expiryInMilliseconds);
        return Jwts.builder()
                .claim(ROLE, role)
                .setSubject(id)
                .setExpiration(expiry)
                .setIssuedAt(nowDate)
                .signWith(key, ALGORITHM)
                .compact();
    }

    private String createToken(Map<String, Object> claimsMap, String subject, Date nowDate, Date expiresIn) {
        log.debug("nowDate={}, expirationDate={}, claimsMap={}", nowDate, expiresIn, claimsMap);
        Claims claims = Jwts.claims(claimsMap);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(nowDate)
                .setExpiration(expiresIn)
                .signWith(key, ALGORITHM)
                .compact();
    }


    private String createToken(String subject, Map<String, Object> claimsMap, long validityInMilliseconds) {
        final Date nowDate = DateUtils.nowDate();
        final Date expirationDate = new Date(nowDate.getTime() + validityInMilliseconds);
        log.debug("nowDate={}, expirationDate={}", nowDate, expirationDate);
        Claims claims = Jwts.claims(claimsMap);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(nowDate)
                .setExpiration(expirationDate)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    private String createToken(String subject, Claims claims, long validityInMilliseconds) {
        final Date nowDate = DateUtils.nowDate();
        final Date expirationDate = new Date(nowDate.getTime() + validityInMilliseconds);
        log.debug("nowDate={}, expirationDate={}", nowDate, expirationDate);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(nowDate)
                .setExpiration(expirationDate)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }


    private String createToken(String subject, Map<String, Object> claimsMap, Date expiry) {
        final Date nowDate = DateUtils.nowDate();
        Claims claims = Jwts.claims(claimsMap);
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(nowDate)
                .setExpiration(expiry)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    private String createToken(String subject, Claims claims, Date expiry) {
        final Date nowDate = DateUtils.nowDate();
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(subject)
                .setIssuedAt(nowDate)
                .setExpiration(expiry)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    public String getToken() {
        return token;
    }
}
