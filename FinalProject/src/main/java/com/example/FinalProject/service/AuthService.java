package com.example.FinalProject.service;

import com.example.FinalProject.entity.Token;
import com.example.FinalProject.entity.User;
import com.example.FinalProject.jwt.JwtService;
import com.example.FinalProject.repository.TokenRepository;
import com.example.FinalProject.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final TokenRepository tokenRepository;
    private final AuthenticationManager authenticationManager;
//    private final EmailService emailService;

    private void saveUserToken(String jwt, User user) {
        Token token = new Token();
        token.setToken(jwt);
        token.setLoggedOut(false);
        token.setUser(user);

        tokenRepository.save(token);
    }

    private void revokeAllTokenByUser(User user) {

        List<Token> validTokens = tokenRepository.findAllTokensByUser(user.getId());
        if (validTokens.isEmpty()) {
            return;
        }
        // Set all valid tokens for the user to logged out
        validTokens.forEach(t -> {
            t.setLoggedOut(true);
        });
        // Save the changes to the tokens in the token repository
        tokenRepository.saveAll(validTokens);
    }
}
