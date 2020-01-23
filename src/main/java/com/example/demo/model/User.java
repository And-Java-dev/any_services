package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
@Builder

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String name;
    @Column
    private String surname;
    @Column
    private String email;
    @Column
    private String password;
    @Column(name = "image_path")
    private String imagePath;
    @Column
    private double rating;
    @Enumerated(EnumType.STRING)
    private UserType usertype;
    @Column
    private int age;
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column
    private boolean isEnable;

    @ManyToMany
    private List<Service> services;



}
