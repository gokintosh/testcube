package com.gokul.cubedemo.controller;


import com.gokul.cubedemo.entity.Message;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/message")
public class MessageController {

    @GetMapping("")
    public Message getMessage(){
       return Message.builder().message("Hello World!!").build();
    }
}
