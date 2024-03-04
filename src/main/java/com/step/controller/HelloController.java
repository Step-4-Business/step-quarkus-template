package com.step.controller;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import lombok.extern.slf4j.Slf4j;

@Path("hello")
@Slf4j
public class HelloController {

    @GET
    public String hello(){
        return "Hello";
    }
}
