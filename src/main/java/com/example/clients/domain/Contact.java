package com.example.clients.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.xml.bind.annotation.XmlTransient;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "CONTACT", schema = "PUBLIC")
public class Contact implements Serializable {
    @Serial
    private static final long serialVersionUID = 1105122041958251257L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clientId")
    private Client client;
    @Column(name = "txtContent")
    private String txtContent;
    @Column(columnDefinition = "enum")
    @Enumerated(EnumType.STRING)
    private ContactType contactType;

    public Contact() {
    }

    public Contact(int id, Client client, String txtContent, ContactType contactType) {
        this.id = id;
        this.client = client;
        this.txtContent = txtContent;
        this.contactType = contactType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @XmlTransient
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public String getTxtContent() {
        return txtContent;
    }

    public void setTxtContent(String txtContent) {
        this.txtContent = txtContent;
    }

    public ContactType getContactType() {
        return contactType;
    }

    public void setContactType(ContactType contactType) {
        this.contactType = contactType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Contact contact = (Contact) o;
        return id == contact.id && client.equals(contact.client) && txtContent.equals(contact.txtContent)
                && contactType == contact.contactType;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, client, txtContent, contactType);
    }
}
