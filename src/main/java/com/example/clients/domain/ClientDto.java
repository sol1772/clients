package com.example.clients.domain;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

public class ClientDto {
    private final List<Contact> contacts = new ArrayList<>();
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;

    public ClientDto() {
    }

    public ClientDto(String firstName, String lastName, String email, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    public ClientDto(int id, String firstName, String lastName, String email, String phone) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public Client toNewClient(ClientDto dto) {
        Client client = new Client(dto.getFirstName(), dto.getLastName());
        if (!StringUtils.isEmpty(dto.getEmail())) {
            client.getContacts().add(new Contact(0, client, dto.getEmail(), ContactType.EMAIL));
        }
        if (!StringUtils.isEmpty(dto.getPhone())) {
            client.getContacts().add(new Contact(0, client, dto.getPhone(), ContactType.PHONE));
        }
        return client;
    }

    public Client toClient(Client client, ClientDto dto) {
        client.setFirstName(dto.getFirstName());
        client.setLastName(dto.getLastName());
        client.getContacts().clear();
        for (Contact contact : dto.getContacts()) {
            if (!StringUtils.isEmpty(contact.getTxtContent()) && contact.getContactType() != null) {
                client.getContacts().add(new Contact(contact.getId(), client, contact.getTxtContent(), contact.getContactType()));
            }
        }
        return client;
    }
}
