package com.step.controller;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;

@QuarkusTest
class CPStatusControllerTest {

    @Test
    void heathTest() {
        given()
                .when().get("/-/healthz")
                .then()
                .statusCode(200);
    }

    @Test
    void readyTest() {
        given()
                .when().get("/-/ready")
                .then()
                .statusCode(200);
    }

    @Test
    void checkUpTest() {
        given()
                .when().get("/-/check-up")
                .then()
                .statusCode(200);
    }

}
