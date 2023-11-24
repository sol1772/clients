package com.example.clients.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "CLIENT", schema = "PUBLIC")
@XmlRootElement(name = "account")
@XmlType(propOrder = {"id", "firstName", "lastName", "contacts"})
public class Client implements Serializable {
    @Serial
    private static final long serialVersionUID = 1905122041950251207L;
    @JsonManagedReference
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL)
    private final List<Contact> contacts = new ArrayList<>();
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    @CreationTimestamp
    @DateTimeFormat(pattern = Utils.DATE_TIME_PATTERN)
    private LocalDateTime registeredAt;

    public Client() {
    }

    public Client(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @XmlElement
    public List<Contact> getContacts() {
        return contacts;
    }

    public int getId() {
        return id;
    }

    @XmlAttribute
    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return "Client {id=" + id + ", '" + firstName + " " + lastName + "'}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Client client = (Client) o;
        return id == client.id && Objects.equals(contacts, client.contacts) && firstName.equals(client.firstName)
                && lastName.equals(client.lastName) && Objects.equals(registeredAt, client.registeredAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(contacts, id, firstName, lastName, registeredAt);
    }
}
