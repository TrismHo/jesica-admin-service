package com.trism.jesica.Util.Secure.token;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Key;
import java.util.Date;
import java.util.Map;


@Slf4j
@RequiredArgsConstructor
public class AuthTokenProvider {

    private final Key key;

    public AuthTokenProvider(String secret) {
        log.info("@@ Init AuthTokenProvider secret:{}", secret);
        this.key = Keys.hmacShaKeyFor(secret.getBytes());
    }

    public AuthTokenProvider(byte[] contents) {
        log.info("@@ Init AuthTokenProvider");
        this.key = Keys.hmacShaKeyFor(contents);
    }

    public Token createToken(String id, Date expiry) {
        return new Token(id, expiry, this.key);
    }

    public Token createToken(String id, Date expiry, String role) {
        return new Token(id, expiry, role, this.key);
    }

    public Token createToken(String token) {
        return new Token(token, this.key);
    }

    public Token createToken(String id, long expiryInMilliseconds) {
        return new Token(id ,expiryInMilliseconds, this.key);
    }

    public Token createToken(String id, long expiryInMilliseconds, String role) {
        return new Token(id ,expiryInMilliseconds, role, this.key);
    }

    public Token createToken(String subject, long expiryInMilliseconds, Claims claims) {
        return new Token(subject ,expiryInMilliseconds, claims, this.key);
    }

    public Token createToken(String subject, long expiryInMilliseconds, Map<String, Object> claimsMap) {
        return new Token(subject ,expiryInMilliseconds, claimsMap, this.key);
    }

    public Token createToken(String subject, Date expiry, Claims claims) {
        return new Token(subject ,expiry, this.key);
    }

    public Token createToken(String subject, Date expiry, Map<String, Object> claimsMap) {
        return new Token(subject ,expiry, claimsMap, this.key);
    }

    public Token createToken(String subject, Date nowDate, Date expiry, Map<String, Object> claimsMap) {
        return new Token(subject, nowDate, expiry, claimsMap, this.key);
    }

    public Token convertToken(String token) {
        return new Token(token, key);
    }

//    public Mono<Authentication> getAuthentication(Token token) {
//        if(token.isClaims()) {
//            Claims claims = token.getTokenClaims();
//            Collection<? extends GrantedAuthority> authorities =
//                    Arrays.stream(new String[]{claims.get(Token.ROLE).toString()})
//                            .map(SimpleGrantedAuthority::new)
//                            .collect(Collectors.toList());
//
//            log.debug("claims subject := [{}]", claims.getSubject());
//            return convertUserDetailsInfo(claims)
//                    .map(this::createUsernamePasswordAuthenticationToken);
//
//        } else {
//            throw new TokenValidFailedException();
//        }
//    }
//
//
//    private Mono<UserDetailsInfo> convertUserDetailsInfo(Claims claims) {
//        String role = claims.get("role", String.class);
//        UserDetailsInfo.UserDetailsInfoBuilder builder = UserDetailsInfo.builder()
//                .userNo(claims.get("userNo", Long.class))
//                .clientId(claims.get("clientId", String.class))
//                .name(claims.get("name", String.class))
//                .deviceId(claims.get("deviceId", String.class))
//                .role(role)
//                .deviceType(claims.get("deviceType", String.class))
//                .authProvider(claims.get("authProvider", String.class))
//                .loginKey(claims.get("loginKey", String.class));
//
//        if (!role.equals("UT_CUST") && !role.equals("UT_COMMON")) {
//            builder.storeNo(claims.get("storeNo", Long.class));
//            builder.branchNo(claims.get("branchNo", Long.class));
//            builder.headNo(claims.get("headNo", Long.class));
//        }
//
//
//        return Mono.just(builder.build());
//    }
//
//    private UsernamePasswordAuthenticationToken createUsernamePasswordAuthenticationToken(UserDetailsInfo userDetails) {
//        return new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(),
//                userDetails.getAuthorities());
//    }
}
