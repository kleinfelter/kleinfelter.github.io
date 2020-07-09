package com.kleinfelter.helloappfuse.model;
import org.appfuse.model.BaseObject;   
import javax.persistence.Entity;   
import javax.persistence.GenerationType;   
import javax.persistence.Id;   
import javax.persistence.GeneratedValue;   
import javax.persistence.Column;   


@Entity
public class Address extends BaseObject {
    private Long id;
    private String name;
    private String street;
    private String city;
    private String state;
    private String zip;
    private String phone;
    
}
